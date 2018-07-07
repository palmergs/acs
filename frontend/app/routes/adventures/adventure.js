import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    console.log("adventures/adventure", params, params.adventure_id);
    return this.store.findRecord('adventure', params.adventure_id);
  },

  actions: {
    save() {
      const model = this.get('model');
      console.log("model");
      console.log(model);
      model.save().then((adventure) => {
        console.log(adventure);
        this.transitionToRoute('adventures');
      }, (errors) => {
        console.log("In errors...");
        console.log(errors);
      });
    },

    cancel() {
      const model = this.get('model');
      if(model) {
        if(model.get('isNew')) {
          // model.deleteRecord();
          model.rollbackAttributes();
        } else {
          model.rollbackAttributes();
        }
      }
      this.transitionToRoute('adventures');
    }
  }
});
