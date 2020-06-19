import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | adventures/adventure/rooms', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:adventures/adventure/rooms');
    assert.ok(route);
  });
});
