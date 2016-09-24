import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'canvas',
  attributeBindings: [ 'width', 'height', 'tabindex', 'canvasStyle:style' ],
  width: 800,
  height: 500,
  tabindex: 1,
  tileSize: 16,
  cx: 200,        // current perspective - x
  cy: 100,        // current perspective - y
  ca: 0,          // current perspective - angle

  keyDown: function(evt) {
    const code = evt.keyCode;
    switch(code) {
      case 39: // right
        this.set('ca', 270);
        this.set('cx', this.get('cx') + 1);
        break;
      case 37: // left
        this.set('ca', 90);
        this.set('cx', this.get('cx') - 1);
        break;
      case 38: // up
        this.set('ca', 180);
        this.set('cy', this.get('cy') - 1);
        break;
      case 40: // down
        this.set('ca', 0);
        this.set('cy', this.get('cy') + 1);
        break;
      default:
        console.log(code);
    }
  },

  drawTimestamp(ctx, ts) {
    ctx.font = "16px Arial";
    ctx.fillStyle = "#0095DD";
    ctx.fillText(`Frame: ${ Math.round(ts) } X: ${ this.get('cx') } Y: ${ this.get('cy') }`, 8, 20);
  },

  drawMap(ctx, floormap) {
    const viewWidth = this.$().parent().width(),
        viewHeight = this.get('height'),
        tileSize = this.get('tileSize'),
        viewRows = Math.floor(viewHeight / tileSize) + 1,
        viewCols = Math.floor(viewWidth / tileSize) + 1,
        viewX = this.get('cx'),
        viewY = this.get('cy'),
        viewAngle = this.get('ca'),
        offsetX = viewX - Math.floor(viewCols / 2),
        offsetY = viewY - Math.floor(viewRows / 2),
        bitmap = this.get('bitmap'),
        bitmapRows = this.get('rows'),
        bitmapCols = this.get('cols');

    // reset width in case view port has changed
    this.set('width', viewWidth);

    for(let r = 0; r < viewRows; ++r) {
      let displayR = r + offsetY;
      for(let c = 0; c < viewCols; ++c) {
        let displayC = c + offsetX;
        let value = bitmap[displayR * bitmapCols + displayC];
        ctx.drawImage(floormap, value * 16, 0, 16, 16, c * tileSize, r * tileSize, tileSize, tileSize);
      }
    }
  },

  drawCharacter(ctx, char) {
    ctx.save();
    const viewWidth = this.get('width'),
        viewHeight = this.get('height'),
        tileSize = this.get('tileSize');
    ctx.translate(viewWidth / 2, viewHeight / 2);
    ctx.rotate((Math.PI/180) * (this.get('ca') % 360) );
    ctx.translate(-viewWidth / 2, -viewHeight / 2);
    ctx.strokeStyle = 'rgba(180, 40, 40, 0.2)';
    ctx.translate(0.5, 0.5);
    ctx.arc(Math.floor(viewWidth / 2),
        Math.floor(viewHeight / 2),
        tileSize * 1.5,
        0,
        Math.PI * 2);
    ctx.stroke();
    ctx.translate(-0.5, -0.5);
    ctx.drawImage(char, 0, 0, 174, 153,
        Math.floor(viewWidth / 2 - tileSize * 1.5),
        Math.floor(viewHeight / 2 - tileSize * 1.5),
        tileSize * 3,
        tileSize * 3);
    ctx.restore();
  },

  didInsertElement() {
    this._super(...arguments);

    const canvas = this.$()[0];
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = "#f0fff8";

    const w = this.get('width'),
        h = this.get('height');

    let lastTimestamp = 0;

    const char = new Image();
    char.src = '/assets/tokens/character.png';

    const floormap = new Image();
    floormap.src = '/assets/tilemaps/floors.png';

    Ember.$.ajax({
      url: 'http://localhost:3000/floorplans/castle-only.json'
    }).done((json) => {
      this.set('bitmap', json.data);
      this.set('rows', +json.height);
      this.set('cols', +json.width);
      console.log("Loaded bitmap...", json.width, json.height);
      const draw = (ts) => {
        // ctx.fillStyle = '#eeffee';
        // ctx.fillRect(0, 0, w, h);
        // ctx.save();
        // ctx.translate(w / 2, h / 2);
        // ctx.rotate((Math.PI/180) * (this.get('ca') % 360) );
        // ctx.translate(-w / 2, -h / 2);
        this.drawMap(ctx, floormap);
        this.drawCharacter(ctx, char);
        // ctx.restore();
        this.drawTimestamp(ctx, ts - lastTimestamp);
        lastTimestamp = ts;
        requestAnimationFrame(draw);
      };
      draw();
    });
  }
});
