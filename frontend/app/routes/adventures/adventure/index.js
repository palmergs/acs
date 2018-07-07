import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    console.log("adventure/index params=", params);
    return this.modelFor('adventures.adventure');
  }
});
