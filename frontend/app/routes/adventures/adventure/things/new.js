import Route from '@ember/routing/route';

export default class AdventuresAdventureThingsNewRoute extends Route {
  async model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return this.store.createRecord('thing', {
      adventure: adventure,
      category: 'treasure',
      droppable: true,
      buyable: true,
      value: 1,
      weight: 0,
      maxStack: 255,
      maxCarry: 255,
    });
  }
}
