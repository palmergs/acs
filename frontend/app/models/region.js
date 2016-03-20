import DS from 'ember-data';

export default DS.Model.extend({
  map:        DS.belongsTo('map'),
  tilePicture: DS.belongsTo('tile-picture'),

  name:       DS.attr('string'),
  description: DS.attr('string'),
  width:      DS.attr('number', { default: 40 }),
  height:     DS.attr('number', { default: 40 }),
  x:          DS.attr('number', { default: 0 }),
  y:          DS.attr('number', { default: 0 }),
  enter:      DS.attr('string'),
  leave:      DS.attr('string'),

  rooms:      DS.hasMany('room')
});
