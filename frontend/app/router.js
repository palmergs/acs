import EmberRouter from '@ember/routing/router';
import config from './config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function() {
  this.route('about');
  this.route('adventures', function() {
    this.route('adventure', { path: "/:adventure_id" }, function() {

    });
  });
});
