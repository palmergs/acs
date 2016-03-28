// import DS from 'ember-data';
//
// export default DS.JSONAPISerializer.extend({
//   serialize() {
//     const result = this._super(...arguments),
//         attr = result.data.attributes || {},
//         rel = result.data.relationships || {};
//
//     console.log("in serializer...");
//     console.log(result);
//
//     console.log("attributes...");
//     console.log(attr);
//
//     console.log("relationshipts...");
//     console.log(rel);
//
//     const returnMe = Object.keys(rel).reduce(function(acc, elem) {
//       const data = rel[elem].data;
//       if(data) {
//         acc[`${ elem }_id`] = data.id;
//       }
//       if(data && data.type) {
//         acc[`${ elem }_type`] = data.type[0].toUpperCase() + data.type.slice(1, -1);
//       }
//       return acc;
//     }, attr);
//
//     console.log(returnMe);
//     return returnMe;
//   }
// });

// app/serializers/application.js
import Ember from 'ember';
import DS from 'ember-data';
var underscore = Ember.String.underscore;

export default DS.JSONAPISerializer.extend({ });
//   keyForAttribute: function(attr) {
//     console.log(`raw attribute = ${ attr }`);
//     return underscore(attr);
//   },
//
//   keyForRelationship: function(rawKey) {
//     console.log(`raw key = ${ rawKey }`);
//     return underscore(rawKey);
//   }
// });
