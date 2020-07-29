import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class EditableSelectComponent extends Component {
  @tracked value = '';

  constructor(owner, args) {
    super(owner, args);
    this.value = args.value;
  }

  @action next() {
    let index = this.args.options.findIndex((val) => val == this.value) + 1;
    if(index >= this.args.options.length) { index = 0; }

    this.value = this.args.options[index];
    this.args.onUpdate(this.value);
  }

  @action prev() {
    let index = this.args.options.findIndex((value) => val == this.value) - 1;
    if(index < 0) { index = this.args.options.length - 1; }

    this.value = this.args.options[index];
    this.args.onUpdate(this.value);
  }
}
