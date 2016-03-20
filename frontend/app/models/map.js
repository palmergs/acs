import DS from 'ember-data';

export default DS.Model.extend({
  adventure:  DS.belongsTo('adventure'),

  name:       DS.attr('string'),
  description: DS.attr('string'),
  width:      DS.attr('number', { default: 40 }),
  height:     DS.attr('number', { default: 40 }),

  regions:    DS.hasMany('region'),
  terrains:   DS.hasMany('terrain')
});
