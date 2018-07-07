import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    console.log("in adventures route...");
    return this.store.findAll('adventure');
  },

  queryParams: {
    page: { refreshModel: true },
    size: { refreshModel: true }
  }

});
