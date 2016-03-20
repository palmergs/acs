import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('welcome', { path: '/' });
  this.route('adventures', { path: 'adventures' }, function() {
    this.route('new', { path: 'new' });
    this.route('adventure', { path: ':adventure_id' }, function() {
      this.route('game');
      this.route('edit');
      this.route('map');
      this.route('terrains');
      this.route('tiles', { path: 'tiles' }, function() {
        this.route('edit', { path: ':tile_id' });
      });
      this.route('creatures', { path: 'creatures'}, function() {
        this.route('new');
        this.route('edit', { path: ':creature_id' });
      });
      this.route('things', { path: 'things' }, function() {
        this.route('new');
        this.route('edit', { path: ':thing_id' });
      });
      this.route('regions', { path: 'regions' }, function() {
        this.route('new');
        this.route('edit', { path: ':region_id' });
      });
      this.route('rooms', { path: 'rooms' }, function() {
        this.route('edit', { path: ':room_id' });
      });
    });
  });
});

export default Router;
