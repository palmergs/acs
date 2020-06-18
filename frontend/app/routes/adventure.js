import Route from '@ember/routing/route';

export default class AdventureRoute extends Route {
  async model() {
    console.log("In adventure route...");
    return this.store.findAll('adventure');
  }
}
