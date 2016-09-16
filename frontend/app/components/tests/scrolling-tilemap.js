import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'canvas',
  attributeBindings: [ 'width', 'height', 'tabindex' ],
  width: 1154,
  height: 1154,
  tabindex: 1,
  cols: 26,
  rows: 24,
  tcols: 8,
  trows: 4,
  tsize: 64,
  tiles: [
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14,  0,  1,  2, 14,  0,  1,  1,  2, 14, 14, 14, 14, 14,  0,  1,  2, 14,  0,  1,  1,  2, 14, 14, 14,
    14, 14,  8,  9, 10, 14, 16, 17, 17, 18, 14, 14, 14, 14, 14,  8,  9, 10, 14, 16, 17, 17, 18, 14, 14, 14,
    14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 16, 17, 18, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 16, 17, 18, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14,  0,  1,  2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  0,  1,  2, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 16, 17, 18, 14, 29, 29, 29, 29, 29, 14, 14, 14, 14, 16, 17, 18, 14, 29, 29, 29, 29, 29, 14, 14,
    14, 14, 14, 14, 14, 14, 29, 29, 29, 29, 29, 14, 14, 14, 14, 14, 14, 14, 14, 29, 29, 29, 29, 29, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14,  0,  1,  2, 14,  0,  1,  1,  2, 14, 14, 14, 14, 14,  0,  1,  2, 14,  0,  1,  1,  2, 14, 14, 14,
    14, 14,  8,  9, 10, 14, 16, 17, 17, 18, 14, 14, 14, 14, 14,  8,  9, 10, 14, 16, 17, 17, 18, 14, 14, 14,
    14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 16, 17, 18, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 16, 17, 18, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14,  0,  1,  2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  0,  1,  2, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  8,  9, 10, 14, 14, 14, 14, 14, 14, 14, 14,
    14, 14, 16, 17, 18, 14, 29, 29, 29, 29, 29, 14, 14, 14, 14, 16, 17, 18, 14, 29, 29, 29, 29, 29, 14, 14,
    14, 14, 14, 14, 14, 14, 29, 29, 29, 29, 29, 14, 14, 14, 14, 14, 14, 14, 14, 29, 29, 29, 29, 29, 14, 14,
    14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
  ],
  tileAt(col, row) {
    const tiles = this.get('tiles'),
      mapCols = this.get('cols');
    return +tiles[row * mapCols + col];
  },
  drawFramerate(ctx, ts) {
    ctx.font = "16px Arial";
    ctx.fillStyle = "#0095DD";
    ctx.fillText(`Frame: ${ ts }`, 8, 20);
  },
  drawMap(ctx, tileAtlas) {
    const w = this.$().parent().width(),
        h = this.get('height'),
        mapCols = +this.get('cols'),
        mapRows = +this.get('rows'),
        tcols = +this.get('tcols'),
        tsize = +this.get('tsize'),
        tiles = +this.get('tiles');
    console.log(`width=${ w }`);
    this.set('width', w);
    ctx.translate(-3 * tsize, -3 * tsize)
    for(let r = 0; r < mapRows; ++r) {
      for(let c = 0; c < mapCols; ++c) {
        let tile = this.tileAt(c, r);
        ctx.drawImage(
            tileAtlas,
            (tile % tcols) * tsize,
            parseInt(tile / tcols) * tsize,
            tsize,
            tsize,
            0,
            0,
            tsize * 1.02,
            tsize * 1.02);
        ctx.translate(tsize, 0);
      }
      ctx.translate(-mapCols * tsize, tsize);
    }
  },
  didInsertElement() {
    this._super(...arguments);
    const canvas = this.$()[0];
    const ctx = canvas.getContext('2d');
    const atlas = new Image();
    let cnt = 0,
        lastTimestamp = 0;
    atlas.src = '/assets/tilemaps/tile_atlas.png';
    atlas.onload = () => {
      const loop = (ts) => {
        const w = this.get('width'),  h = this.get('height');
        console.log(`canvas width=${ w }`);
        ctx.save();
        ctx.translate(w / 2, h / 2);
        ctx.rotate((Math.PI/180) * (cnt % 360) );
        ctx.translate(-w / 2, -h / 2);
        this.drawMap(ctx, atlas);
        ctx.restore();
        this.drawFramerate(ctx, lastTimestamp - ts);
        lastTimestamp = ts;
        cnt++;
        requestAnimationFrame(loop);
      }
      loop();

    }
  }
});
