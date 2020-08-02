import Route from '@ember/routing/route';

export default class AdventuresAdventureRegionsNewRoute extends Route {
  async model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return this.store.createRecord('region', {
      adventure: adventure,
      width: 3,
      height: 3
    });
  }
}
