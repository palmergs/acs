import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findAll('creature');
  },

  queryParams: {
    page: { refreshModel: true },
    size: { refreshModel: true }
  }

});
