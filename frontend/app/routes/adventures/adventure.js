import Route from '@ember/routing/route';

export default class AdventuresAdventureRoute extends Route {
    async model(params) {
        return this.store.findRecord('adventure', params.adventure_id)
    }
}
