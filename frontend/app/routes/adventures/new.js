import Route from '@ember/routing/route';

export default class AdventuresNewRoute extends Route {
  model() {
    return this.store.createRecord('adventure', {
      rating: 'general',
      access: 'private',
      genre: 'fantasy'
    });
  }

  setupController(controller) {
    super.setupController(...arguments);
    controller.set('adventure', this.modelFor('adventures.new'));
  }
}
