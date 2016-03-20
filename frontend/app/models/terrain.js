import DS from 'ember-data';

export default DS.Model.extend({
  map:        DS.belongsTo('map'),
  tilePicture: DS.belongsTo('tile-picture'),
  
  name:       DS.attr('string'),
  description: DS.attr('string'),
  encounterChance: DS.attr('number')
});
