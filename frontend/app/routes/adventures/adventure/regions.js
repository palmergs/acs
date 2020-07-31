import Route from '@ember/routing/route';

export default class AdventuresAdventureRegionsRoute extends Route {
  async model(params) {
    const adventure = this.modelFor("adventures.adventure");
    return {
      adventure: adventure,
      regions: this.store.query('region', { filter: { adventure: adventure.id } })
    };
  }
}
