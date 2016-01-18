import Ember from 'ember';

export default Ember.Component.extend({
  tagName:    'td',
  classNames: 'color-picker-cell',
  attributeBindings: [ 'style:style' ],
  color:      null,
  opacity:    1.0,
  values:     Ember.computed('color', function() {
    const hex = this.get('color');
    const r = parseInt(hex.substring(1,3), 16);
    const g = parseInt(hex.substring(3,5), 16);
    const b = parseInt(hex.substring(5,7), 16);
    const opacity = this.get('opacity');
    return [ r, g, b, opacity ];
  }),
  rgb:        Ember.computed('values', function() {
    const values = this.get('values');
    return new Ember.Handlebars.SafeString(`rgb(${ values[0] },${ values[1] },${ values[2] })`);
  }),
  rgba:       Ember.computed('values', function() {
    const values = this.get('values');
    return new Ember.Handlebars.SafeString(`rgba(${ values[0] },${ values[1] },${ values[2] },${ values[3] })`);
  }),
  style:      Ember.computed('rgba', function() {
    const rgba = this.get('rgba');
    return new Ember.Handlebars.SafeString(`background-color: ${ rgba }`);
  })
});
