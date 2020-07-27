import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class EditableAreaComponent extends Component {
  @tracked isEditing = false
  @tracked value = '';

  @action startEditing() {
    this.value = this.args.value;
    this.isEditing = true;
  }

  @action cancel() {
    this.isEditing = false;
    this.value = '';
  }

  @action update(evt) {
    this.value = evt.target.value;
  }

  @action submit() {
    this.isEditing = false;
    this.args.onUpdate(this.value);
  }

  @action focus(element) {
    element.focus();
  }
}
