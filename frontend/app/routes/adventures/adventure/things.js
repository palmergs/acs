import Route from '@ember/routing/route';

export default class AdventuresAdventureThingsRoute extends Route {
  async model(params) {
    return this.store.findAll('thing', { adventure_id: params.adventure_id });
  }
}
