import Model, { attr } from '@ember-data/model';

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
}
