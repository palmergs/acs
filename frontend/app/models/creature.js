import Model, { attr, belongsTo } from '@ember-data/model';

export default class CreatureModel extends Model {
  @attr('string') name;
  @attr('string') descr;
  @attr('string') category;

  @attr('number') speed;
  @attr('number') life;
  @attr('number') constitution;
  @attr('number') power;
  @attr('number') wisdom;
  @attr('number') strength;
  @attr('number') size;
  @attr('number') dexterity;

  @attr('number') missileSkill;
  @attr('number') meleeSkill;
  @attr('number') dodgeSkill;
  @attr('number') armorSkill;

  @attr('string') magicalDefense;
  @attr('string') personality;
  @attr('string') outlook;
  @attr('string') alliance;

  @belongsTo adventure;
}
