import Route from '@ember/routing/route';

export default class AdventuresAdventureThingsThingRoute extends Route {
  async model(params) {
    return this.store.findRecord('thing', params.thing_id);
  }
}
