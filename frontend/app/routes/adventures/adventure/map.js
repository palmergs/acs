import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    const adventure = this.modelFor('adventures.adventure');
    return adventure.get('map');
  }
});
