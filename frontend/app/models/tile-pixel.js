import Ember from 'ember';

export default Ember.Object.extend({

  setPixelData: function(arr) {
    this.set('red', arr[0]);
    this.set('green', arr[1]);
    this.set('blue', arr[2]);
    this.set('alpha', arr[3] / 256.0);
  },

  inTile:     true,

  red:        0,
  green:      0,
  blue:       0,
  alpha:      0.0,

  rgba:       Ember.computed('red', 'green', 'blue', 'alpha', function() {
    const r = this.get('red'),
          g = this.get('green'),
          b = this.get('blue'),
          a = this.get('alpha');
    let val = new Ember.Handlebars.SafeString(
        `rgba(${ r },${ g },${ b },${ a })`);
    console.log(val);
    return val;
  })

});
