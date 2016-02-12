import Ember from 'ember';
import TilePixel from 'frontend/models/tile-pixel';

export default Ember.Component.extend({

  width:      32,
  height:     32,
  overlayTop: 32,
  overlayBottom: 0,
  overlayLeft: 8,
  overlayRight: 8,

  canvas:     null,

  slugObserver: function() {
    const slug = this.get('slug');
    if(slug) {
      console.log(slug);
      let img = document.getElementById(slug);
      img.crossOrigin = "Anonymous";
      console.log(img);
      let canvas = document.createElement('canvas');
      canvas.width = img.width;
      canvas.height = img.height;
      canvas.getContext('2d').drawImage(img, 0, 0, img.width, img.height);
      this.set('canvas', canvas);
    }
  }.observes('slug'),

  rows:       Ember.computed('canvas',
      'width', 'height',
      'overlayTop', 'overlayBottom',
      'overlayLeft', 'overlayRight', function() {

    const canvas = this.get('canvas');

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

        let pixel = TilePixel.create({ inTile: inTile });
        if(canvas) {
          let dat = canvas.getContext('2d').getImageData(c, r, 1, 1).data;
          pixel.setPixelData(dat);
        }

        row.pushObject(pixel);
      }
      arr.pushObject(row);
    }
    return arr;
  })

});
