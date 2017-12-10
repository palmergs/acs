import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('scrolling');
  this.route('grid-test');
  this.route('explorer');
  this.route('breakout');
  this.route('pictures');

  this.route('home', { path: '/home' });
  this.route('play', { path: '/adventure/:adventure_id' });
  this.route('adventures', { path: '/adventures' }, function() {
    this.route('new');
    this.route('adventure', { path: ':adventure_id' }, function() {
      this.route('edit');
      this.route('map');
      this.route('regions', function() {
        this.route('new');
        this.route('edit', { path: ':region_id' }, function() {
          this.route('rooms', function() {
            this.route('new');
            this.route('edit', { path: ':room_id' });
          });
        });
      });
      this.route('terrains', { path: 'terrains' }, function() {
        this.route('new');
        this.route('edit', { path: ':terrain_id' });  
      });
      this.route('creatures', { path: 'creatures' }, function() {
        this.route('new');
        this.route('edit', { path: ':creature_id' });
      });
      this.route('things', function() {
        this.route('new');
        this.route('edit', { path: ':thing_id' });
      });
      this.route('tiles', function() {
        this.route('new');
        this.route('edit', { path: ':tile_id' });
      });
    });
  });
});

export default Router;
