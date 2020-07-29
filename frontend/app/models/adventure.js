import Model, { attr, hasMany } from '@ember-data/model';

export default class AdventureModel extends Model {
  @attr('string') name;
  @attr('string') descr;
  @attr('string') intro;
  @attr('string') rating;
  @attr('string') genre;
  @attr('string') access;
  @hasMany maps;
  @hasMany regions;
  @hasMany creatures;
}
