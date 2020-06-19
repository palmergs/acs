import Route from '@ember/routing/route';

export default class AdventuresAdventureCreaturesRoute extends Route {
  async model(params) {
    return this.store.findAll('creature', { adventure_id: params.adventure_id });
  }
}
