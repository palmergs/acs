import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.findAll('thing');
  },

  queryParams: {
    page: { refreshModel: true },
    size: { refreshModel: true }
  }

});
