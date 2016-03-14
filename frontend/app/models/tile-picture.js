import DS from 'ember-data';

export default DS.Model.extend({
  adventure:  DS.belongsTo('adventure'),

  name:       DS.attr('string'),
  description: DS.attr('string'),
  category:   DS.attr('string'),
  setting:    DS.attr('string')
});
