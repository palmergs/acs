import Route from '@ember/routing/route';

export default class IndexRoute extends Route {
  async model() {
    console.log("In adventure/index route...");
    let model = this.store.findAll('adventure');
    console.log(model);
    return model;
  }
}
