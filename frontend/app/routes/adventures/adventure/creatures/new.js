import Route from '@ember/routing/route';

export default class AdventuresAdventureCreaturesNewRoute extends Route {
  model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return this.store.createRecord('creature', {
      adventure: adventure,
      magicalDefense: 'none',
      personality: 'Brave',
      outlook: 'Aggressive',
      alliance: 'Enemy'
    });
  }

  setupController(controller) {
    super.setupController(...arguments);
    controller.set('creature', this.modelFor('adventures.adventure.creatures.new'));
  }
}
