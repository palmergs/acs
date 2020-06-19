import Route from '@ember/routing/route';

export default class ApplicationsApplicationMapsRoute extends Route {
  async model(params) {
    return this.store.findAll('map', { adventure_id: params.adventure_id });
  }
}
