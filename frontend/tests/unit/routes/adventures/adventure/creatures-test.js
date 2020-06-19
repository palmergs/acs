import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | adventures/adventure/creatures', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:adventures/adventure/creatures');
    assert.ok(route);
  });
});
