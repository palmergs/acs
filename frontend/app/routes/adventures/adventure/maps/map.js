import Route from '@ember/routing/route';

export default class AdventuresAdventureMapsMapRoute extends Route {
  async model(params) {
    return this.store.findRecord('map', params.map_id);
  }
}
