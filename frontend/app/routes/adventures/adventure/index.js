import Route from '@ember/routing/route';

export default class AdventuresAdventureIndexRoute extends Route {
  setupController(controller) {
    super.setupController(...arguments);
    controller.set('adventure', this.modelFor('adventures.adventure'));
  }
}
