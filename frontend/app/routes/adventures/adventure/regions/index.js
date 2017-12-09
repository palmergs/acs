import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findAll('region');
  },

  queryParams: {
    page: { refreshModel: true },
    size: { refreshModel: true }
  }

});
