import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | adventures/adventure/regions', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:adventures/adventure/regions');
    assert.ok(route);
  });
});
