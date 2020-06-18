import Model, { attr, belongsTo } from '@ember-data/model';

export default class MapModel extends Model {
  @attr('string') name;
  @attr('string') descr;
  @attr('number') width;
  @attr('number') height;
  @belongsTo adventure;
}
