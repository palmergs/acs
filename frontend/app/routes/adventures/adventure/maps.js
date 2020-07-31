import Route from '@ember/routing/route';

export default class ApplicationsApplicationMapsRoute extends Route {
  async model(params) {
    const adventure = this.modelFor("adventures.adventure");
    return {
      adventure: adventure,
      maps: this.store.query('map', { filter: { adventure: adventure.id } })
    };
  }
}
