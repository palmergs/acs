import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('test-picker');
  this.route('pictures', function() {
    this.route('edit', { path: '/:id' }, function() {

    });
  });
  this.route('adventures', function() {
    
  });
  this.route('creatures', function() {

  });
});

export default Router;
