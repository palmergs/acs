import Route from '@ember/routing/route';

export default class AdventuresAdventureCreaturesCreatureRoute extends Route {
  async model(params) {
    return this.store.findRecord("creature", params.creature_id);
  }
}
