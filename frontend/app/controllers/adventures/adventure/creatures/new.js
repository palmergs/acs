import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class AdventuresAdventureCreaturesNewController extends Controller {
  @action updateValue(field, value) {
    this.model.set(field, value);
  }

  @action save() {
    this.model.save().then((obj) => {
      this.transitionToRoute("adventures.adventure.creatures.creature", obj.id);
    });
  }

  @action cancel() {
    this.transitionToRoute("adventures.adventure.creatures");
  }
}
