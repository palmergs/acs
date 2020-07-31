import EmberRouter from '@ember/routing/router';
import config from './config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function() {
  this.route('about');
  this.route('adventures', function() {
    this.route('new');
    this.route('adventure', { path: ":adventure_id" }, function() {
      this.route('maps', function() {
        this.route('map', { path: ':map_id' });
        this.route('new');
      });
      this.route('regions', function() {
        this.route('region', { path: ':region_id' });
        this.route('new');
      });
      this.route('rooms', function() {
        this.route('room', { path: ':room_id' });
      });
      this.route('creatures', function() {
        this.route('new');
        this.route('creature', { path: ':creature_id' });
      });
      this.route('things');
    });
  });
});
