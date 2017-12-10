import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    const adventure = this.modelFor('adventures.adventure');
    const region = this.store.createRecord('region');
    region.adventure = adventure;
    return region;
  },

  actions: {

  }
});