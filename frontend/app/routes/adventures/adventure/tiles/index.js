import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findAll('tile');
  },

  queryParams: {
    page: { refreshModel: true },
    size: { refreshModel: true }
  }

});
