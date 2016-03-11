import DS from 'ember-data';

export default DS.Model.extend({
  name:       DS.attr('string'),
  description: DS.attr('string'),
  intro:      DS.attr('string'),
  access:     DS.attr('string'),
  rating:     DS.attr('string'),
  createdAt:  DS.attr('date'),
  updatedAt:  DS.attr('datea'),

  creatures:  DS.hasMany('creature')
});
