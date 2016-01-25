import Ember from 'ember';

export default Ember.Component.extend({
  tagName:    'td',
  classNames: 'picture-editor-cell',
  attributeBindings: [ 'style:style' ],
  classNameBindings: [ 'pixel.inTile:tile:overlay' ],
  pixel:      null,
  style:      Ember.computed('pixel.value', function() {
    const pixel = this.get('pixel');
    return new Ember.Handlebars.SafeString(`background-color: ${ pixel.get('rgba') }`);
  })
});
