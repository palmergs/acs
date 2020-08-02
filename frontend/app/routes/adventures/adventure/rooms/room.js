import Route from '@ember/routing/route';

export default class AdventuresAdventureRoomsRoomRoute extends Route {
  async model(params) {
    return this.store.findRecord('room', params.room_id);
  }
}
