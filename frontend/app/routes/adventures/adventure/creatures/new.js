import Route from '@ember/routing/route';

export default class AdventuresAdventureCreaturesNewRoute extends Route {
  model(params) {
    const adventure = this.modelFor('adventures.adventure');
    return this.store.createRecord('creature', {
      adventure: adventure,
      constitution: 10,
      strength: 10,
      wisdom: 8,
      dexterity: 8,
      missileSkill: 0,
      meleeSkill: 20,
      dodgeSkill: 20,
      armorSkill: 0,
      life: 20,
      power: 10,
      speed: 6,
      size: 10,
      magicalDefense: 'none',
      personality: 'Brave',
      outlook: 'Aggressive',
      alliance: 'Enemy'
    });
  }
}
