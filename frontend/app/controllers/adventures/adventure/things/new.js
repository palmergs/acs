import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class AdventuresAdventureThingsNewController extends Controller {
  @action updateValue(field, value) {
    this.model.set(field, value);
  }

  @action save() {
    this.model.save().then((obj) => {
      this.transitionToRoute("adventures.adventure.things.thing", obj.id);
    });
  }

  @action cancel() {
    this.transitionToRoute("adventures.adventure.things");
  }
}
