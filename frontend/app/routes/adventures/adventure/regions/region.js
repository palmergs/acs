import Route from '@ember/routing/route';

export default class AdventuresAdventureRegionsRegionRoute extends Route {
  async model(params) {
    return this.store.findRecord('region', params.region_id);
  }
}
