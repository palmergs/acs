import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class AdventuresAdventureMapsNewController extends Controller {
  @action updateValue(field, value) {
    this.model.set(field, value);
  }

  @action save() {
    this.model.save().then((obj) => {
      this.transitionToRoute("adventures.adventure.maps.map", obj.id);
    });
  }

  @action cancel() {
    this.transitionToRoute("adventures.adventure.maps");
  }
}
