import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return this.store.createRecord('creature', { adventure: adventure });
  },

  actions: {

  }
});
