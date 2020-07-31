import Route from '@ember/routing/route';

export default class AdventuresAdventureCreaturesRoute extends Route {
  async model(params) {
    return this.store.query('creature', { filter: { adventure: params.adventure_id } });
  }
}
