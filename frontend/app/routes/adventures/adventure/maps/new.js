import Route from '@ember/routing/route';

export default class AdventuresAdventureMapsNewRoute extends Route {
  async model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return this.store.createRecord('map', {
      adventure: adventure,
      width: 40,
      height: 30
    });
  }
}
