import DS from 'ember-data';

export default DS.Model.extend({
  region:     DS.belongsTo('region'),

  name:       DS.attr('string'),
  descriptino: DS.attr('string'),
  width:      DS.attr('number', { default: 10 }),
  height:     DS.attr('number', { default: 10 }),
  x:          DS.attr('number', { default: 0 }),
  y:          DS.attr('number', { default: 0 })
});
