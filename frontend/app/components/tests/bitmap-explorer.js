import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'canvas',
  attributeBindings: [ 'width', 'height', 'tabindex', 'canvasStyle:style' ],
  width: 800,
  height: 700,
  tabindex: 1,
  tileSize: 16,
  cx: 200,        // current perspective - x
  cy: 100,        // current perspective - y
  ca: 0,          // current perspective - angle,
  cs: 1,        // current radius in tiles; 0 is smallest

  keyDown: function(evt) {
    const angleDistance = 0.75;
    const code = evt.keyCode;
    let cx = this.get('cx'),
        cy = this.get('cy');
    switch(code) {
      case 54:
      case 39: // right
        this.set('ca', 270);
        cx += 1
        break;
      case 52:
      case 37: // left
        this.set('ca', 90);
        cx -= 1;
        break;
      case 56:
      case 38: // up
        this.set('ca', 180);
        cy -= 1
        break;
      case 50:
      case 40: // down
        this.set('ca', 0);
        cy += 1
        break;
      case 55: // up left
        this.set('ca', 135);
        cy -= angleDistance;
        cx -= angleDistance;
        break;
      case 49: // down left
        this.set('ca', 45);
        cy += angleDistance;
        cx -= angleDistance;
        break;
      case 57: // up right
        this.set('ca', 225);
        cy -= angleDistance;
        cx += angleDistance;
        break;
      case 51: // down right
        this.set('ca', 305);
        cy += angleDistance;
        cx += angleDistance;
      default:
        console.log(code);
    }
    this.canMoveTo([], cx, cy);
    this.setProperties({ cx: cx, cy: cy });
  },

  drawTimestamp(ctx, ts) {
    ctx.font = "16px Arial";
    ctx.fillStyle = "#0095DD";
    ctx.fillText(`Frame: ${ Math.round(ts) } X: ${ Math.round(this.get('cx')) } Y: ${ Math.round(this.get('cy')) }`, 8, 20);
  },

  valueAt(bitmap, bitmapRows, bitmapCols, row, col) {
    if(row >= 0 && row < bitmapRows && col >= 0 && col <= bitmapCols) {
      return bitmap[row * bitmapCols + col] > 0 ? 1 : 0
    } else {
      return 1;
    }
  },

  wallMatrix(bitmap, bitmapRows, bitmapCols, row, col) {
    // covert 0 to empty space, non-zero to wall
    return [
      this.valueAt(bitmap, bitmapRows, bitmapCols, row - 1, col - 1),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row - 1, col),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row - 1, col + 1),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row,     col - 1),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row,     col),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row,     col + 1),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row + 1, col - 1),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row + 1, col),
      this.valueAt(bitmap, bitmapRows, bitmapCols, row + 1, col + 1)
    ];
  },

  canMoveTo(matrix, newRow, newCol) {
    const diffX = Math.round(this.get('cx')) - Math.round(newCol),
        diffY = Math.round(this.get('cy')) - Math.round(newRow);

    console.log(diffX, diffY);
  },

  wallTileCoords(matrix) {
    if(matrix[1] === 0 && matrix[3] === 0 && matrix[5] === 0 && matrix[7] === 0) return 0;
    if(matrix[1] === 0 && matrix[3] === 0 && matrix[5] === 0) return 7;
    if(matrix[7] === 0 && matrix[3] === 0 && matrix[5] === 0) return 10;
    if(matrix[1] === 0 && matrix[7] === 0 && matrix[5] === 0) return 9;
    if(matrix[1] === 0 && matrix[7] === 0 && matrix[3] === 0) return 8;
    if(matrix[5] === 0 && matrix[7] === 0) return 11;
    if(matrix[3] === 0 && matrix[7] === 0) return 12;
    if(matrix[1] === 0 && matrix[3] === 0) return 13;
    if(matrix[1] === 0 && matrix[5] === 0) return 14;

    // if(matrix[1] === 0 && matrix[7] === 0) return
    return 15;
  },

  backgroundTileCoords(matrix) {
    if(matrix[1] > 0 && matrix[3] > 0 && matrix[5] > 0 && matrix[7] > 0) return 15;
    if(matrix[1] > 0 && matrix[3] > 0 && matrix[5] > 0) return 10;
    if(matrix[1] > 0 && matrix[3] > 0 && matrix[7] > 0) return 9;
    if(matrix[1] > 0 && matrix[5] > 0 && matrix[7] > 0) return 8;
    if(matrix[3] > 0 && matrix[5] > 0 && matrix[7] > 0) return 7;
    if(matrix[1] > 0 && matrix[3] > 0) return 2;
    if(matrix[1] > 0 && matrix[5] > 0) return 4;
    if(matrix[3] > 0 && matrix[7] > 0) return 3;
    if(matrix[5] > 0 && matrix[7] > 0) return 1;
    return 0;
  },

  drawMap(ctx, floormap) {
    const viewWidth = this.$().parent().width(),
        viewHeight = this.get('height'),
        tileSize = this.get('tileSize'),
        viewRows = Math.floor(viewHeight / tileSize) + 1,
        viewCols = Math.floor(viewWidth / tileSize) + 1,
        viewX = Math.round(this.get('cx')),
        viewY = Math.round(this.get('cy')),
        offsetX = viewX - Math.floor(viewCols / 2),
        offsetY = viewY - Math.floor(viewRows / 2),
        bitmap = this.get('bitmap'),
        bitmapRows = this.get('rows'),
        bitmapCols = this.get('cols');

    // reset width in case view port has changed
    this.set('width', viewWidth);

    for(let r = 0; r < viewRows; ++r) {
      let mapR = r + offsetY;
      for(let c = 0; c < viewCols; ++c) {
        let mapC = c + offsetX;
        let matrix = this.wallMatrix(bitmap, bitmapRows, bitmapCols, mapR, mapC);
        let grass = 8;
        ctx.drawImage(floormap, grass * 16, 32, 16, 16, c * tileSize, r * tileSize, tileSize, tileSize);
        if(matrix[4] > 0) {
          ctx.drawImage(floormap, this.wallTileCoords(matrix) * 16, 16, 16, 16, c * tileSize, r * tileSize, tileSize, tileSize);
        } else {
          ctx.drawImage(floormap, this.backgroundTileCoords(matrix) * 16, 0, 16, 16, c * tileSize, r * tileSize, tileSize, tileSize);
        }
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
    ctx.lineWidth = 4;
    ctx.beginPath();
    ctx.arc(Math.floor(viewWidth / 2),
        Math.floor(viewHeight / 2),
        tileSize * 1.5,
        0,
        Math.PI * 2);
    ctx.closePath();
    ctx.stroke();
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
    floormap.src = '/assets/tilemaps/background-tiles.png';

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
