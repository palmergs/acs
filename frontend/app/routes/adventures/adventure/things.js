import Route from '@ember/routing/route';

export default class AdventuresAdventureThingsRoute extends Route {
  async model(params) {
    const adventure = this.modelFor("adventures.adventure");
    return {
      adventure: adventure,
      things: this.store.query('thing', { filter: { adventure: adventure.id } })
    };
  }
}
