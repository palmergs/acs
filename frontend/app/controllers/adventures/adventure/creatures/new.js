import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class AdventuresAdventureCreaturesNewController extends Controller {
  @action updateValue(field, value) {
    this.creature.set(field, value);
    // this.creature.save();
  }

  @action save() {
    this.creature.save().then((obj) => {
      this.transitionToRoute("adventures.adventure.creatures.creature", obj.id);
    });
  }

  @action cancel() {
    this.transitionToRoute("adventures.adventure.creatures");
  }
}
