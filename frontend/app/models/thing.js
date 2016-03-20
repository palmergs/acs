import DS from 'ember-data';

export default DS.Model.extend({
  adventure:  DS.belongsTo('adventure'),
  tilePicture: DS.belongsTo('tile-picture'),

  type:       DS.attr('string'),
  name:       DS.attr('string'),
  description: DS.attr('string'),
});
