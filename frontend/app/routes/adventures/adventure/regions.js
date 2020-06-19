import Route from '@ember/routing/route';

export default class AdventuresAdventureRegionsRoute extends Route {
  async model(params) {
    return this.store.findAll('region', { adventure_id: params.adventure_id });
  }
}
