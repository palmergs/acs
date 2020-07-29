import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class AdventuresAdventureIndexController extends Controller {
  @action updateValue(field, value) {
    console.log(`adventure=${ this.adventure }`);
    console.log(`field=${ field } name=${ value }`);
    this.adventure.set(field, value);
    this.adventure.save();
  }
}
