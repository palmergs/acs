import Route from '@ember/routing/route';

export default class AdventuresAdventureRoomsRoute extends Route {
  async model(params) {
    const adventure = this.modelFor("adventures.adventure");
    return {
      adventure: adventure,
      rooms: this.store.query('room', { filter: { adventure: adventure.id } })
    };
  }
}
