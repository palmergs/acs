import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class EditableAreaComponent extends Component {
  @tracked isEditing = false

  @action startEditing() {
    console.log("startEditing: true");
    this.isEditing = true;
  }

  @action cancel() {
    this.isEditing = false;
  }

  @action submit() {
    this.isEditing = false;
  }

  focus(element) {
    element.focus();
  }
}
