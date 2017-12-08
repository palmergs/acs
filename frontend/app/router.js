import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('home', { path: '/home' });
  this.route('play', { path: '/adventure/:adventure_id' });
  this.route('adventures', { path: '/adventures' }, function() {
    this.route('new');
    this.route('edit', { path: 'edit/:adventure_id' }, function() {
      this.route('map');
      this.route('terrains', function() {
        this.route('new');
        this.route('edit', { path: 'edit/:terrain_id' });
      });
      this.route('creatures', function() {
        this.route('new');
        this.route('edit', { path: 'edit/:creature_id' });
      });
      this.route('things', function() {
        this.route('new');
        this.route('edit', { path: 'edit/:thing_id' });
      });
      this.route('tiles', function() {
        this.route('new');
        this.route('edit', { path: 'edit/:tile_id' });
      });
      this.route('icons', function() {
        this.route('new');
        this.route('edit', { path: 'edit/:icon_id' });
      });
      this.route('regions', function() {
        this.route('new');
        this.route('edit', { path: 'edit/:region_id' }, function() {
          this.route('rooms', function() {
            this.route('new');
            this.route('edit', { path: 'edit/:room_id' });
          });
        });
      });
    });
  });
});

export default Router;
