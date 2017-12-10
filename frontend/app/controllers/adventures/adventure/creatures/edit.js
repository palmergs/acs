import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save() {
      const model = this.get('model');
      console.log("model");
      console.log(model);
      model.save().then((creature) => {
        console.log(creature);
        this.transitionToRoute('adventures.adventure.creatures');
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
      this.transitionToRoute('adventures.adventure.creatures');
    }
  }
});
