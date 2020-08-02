import Model, { attr, belongsTo } from '@ember-data/model';

export default class ThingModel extends Model {
  @attr('string') name;
  @attr('string') descr;
  @attr('string') category;

  @attr('number') weight;
  @attr('number') value;
  @attr('number') maxCarry;
  @attr('number') maxStack;
  @attr('boolean') droppable;
  @attr('boolean') buyable;
  @attr('boolean') magic;

  @attr('number') power;
  @attr('number') attack;
  @attr('number') range;
  @attr('number') breakability;

  @belongsTo adventure;

  get isTreasure() {
    return this.category == 'treasure';
  }

  get isWeapon() {
    return this.category == 'weapon';
  }

  get isArmor() {
    return this.category == 'armor';
  }

  get isPortal() {
    return this.category == 'portal';
  }

  get isFloor() {
    return this.category == 'floor';
  }
}
