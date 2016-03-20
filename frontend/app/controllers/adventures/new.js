import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save() {
      const model = this.get('model');
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
