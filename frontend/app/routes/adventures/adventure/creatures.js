import Route from '@ember/routing/route';

export default class AdventuresAdventureCreaturesRoute extends Route {
  async model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return adventure.creatures;
  }
}
