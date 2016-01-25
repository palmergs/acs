import Ember from 'ember';
import TilePixel from 'frontend/models/tile-pixel';

export default Ember.Component.extend({

  width:      24,
  height:     24,
  overlayTop: 12,
  overlayBottom: 0,
  overlayLeft: 8,
  overlayRight: 8,

  rows:       Ember.computed('width', 'height',
      'overlayTop', 'overlayBottom',
      'overlayLeft', 'overlayRight', function() {

    const height = this.get('height'),
          top = this.get('overlayTop'),
          bottom = this.get('overlayBottom');
    const width = this.get('width'),
          left = this.get('overlayLeft'),
          right = this.get('overlayRight');
    const arr = [];
    for(let r = 0; r < height + top + bottom; ++r) {
      let inTileRow = r >= top && r < top + height;
      let row = [];
      for(let c = 0; c < width + left + right; ++c) {
        let inTile = inTileRow && c >= left && c < left + width;
        row.pushObject(TilePixel.create({ color: null, inTile: inTile }));
      }
      arr.pushObject(row);
    }
    return arr;
  })

});
