import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    console.log("adventures/adventure/edit params=", params);
    return this.modelFor('adventures.adventure');
  }
});
