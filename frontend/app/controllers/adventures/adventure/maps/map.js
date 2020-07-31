import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class AdventuresAdventureMapsMapController extends Controller {
  @action updateValue(field, value) {
    this.model.set(field, value);
    this.model.save();
  }
}
