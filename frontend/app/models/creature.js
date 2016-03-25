import DS from 'ember-data';

export default DS.Model.extend({
  adventure:  DS.belongsTo('adventure'),
  tilePicture: DS.belongsTo('tile-picture'),

  type:       DS.attr('string'),
  name:       DS.attr('string'),
  description: DS.attr('string'),

  speed:      DS.attr('number'),
  constitution: DS.attr('number'),
  strength:   DS.attr('number'),
  size:       DS.attr('number'),
  dexterity:  DS.attr('number'),
  wisdom:     DS.attr('number'),

  lifeForce:  DS.attr('number'),
  power:      DS.attr('number'),

  dodgeSkill: DS.attr('number'),
  armorSkill: DS.attr('number'),
  missileSkill: DS.attr('number'),
  parrySkill: DS.attr('number'),
  meleeSkill: DS.attr('number'),

  magicalDefense: DS.attr('string'),

  personality: DS.attr('string'),
  outlook:    DS.attr('string'),
  alliance:   DS.attr('string'),

  createdAt:  DS.attr('date'),
  updatedAt:  DS.attr('date')
});
