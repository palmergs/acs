import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class AdventuresNewController extends Controller {
  @action updateValue(field, value) {
    console.log(`adventure=${ this.adventure }`);
    console.log(`field=${ field } name=${ value }`);
    this.adventure.set(field, value);
  }

  @action save() {
    this.adventure.save().then((adv) => {
      this.transitionToRoute("adventures.adventure", adv.id);
    });
  }

  @action cancel() {
    this.transitionToRoute("adventures");
  }
}
