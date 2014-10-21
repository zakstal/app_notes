---backbone-12: markup injection and XSS, nested Backbone views, form for associated object, markdown, keyup---



html injection attack

we dont want to pust <sctip></script> directly into the dom

underscore espace renders the script tag safely
alwasys escape insetad of get in  a template.

users not allowed to set id

?: can you pass in any key value into the initalize even if its not defined in the extend?

when saving from a form:

prevent default,
get the params through serialize
make a new comment and pass params
savethe comment and on sucesssess add the comment to

.save takes multiple attributes

to have a link that the user can add user markdown
marked javascript library add to vendor/assests/javascript then add to application.js

in jst.ejs template add marked insteard of escaped

when not in a model use _.escpae(content)


---backbone-13: zombie views, listenTo implementation, swapping router, View#remove---


?: the _event 2:31
?: remove old view? 4:25
?: _index view 8:36

indexView.stopListening()  12:04

---backbone-16: editing comments, opening views---

doubleclick on an item and edit it

change a templeate function in views

?: 8:05 why is the template getting the content?

---Backbone.Model II---

parse

toJSON

validates

---Backbone.Collection II---

comparator

The comparator will be used to keep your models in sorted
order. The comparator may be defined in 3 ways:

sortBy ( function with single argument )
sort ( function with two arguments )
attribute ( string indicating the attribute to sort by )

JournalApp.Views.PostsIndex = Backbone.View.extend({
  // ...

  initialize: function () {
    var that = this;

    var events = ["add", "change:title", "remove", "reset"];
    _(events).each(function (event) {
      that.listenTo(that.collection, event, that.render);
    });
  },

  // ...
});


remove: function() {
  this.$el.remove();
  this.stopListening();
  return this;
},

_swapView: function (newView) {
  this._currentView && this._currentView.remove();
  this._currentView = newView;
  this.$rootEl.html(newView.render().$el);
}


---CollectionView Pattern---

better than iteration in views
// prefered
// app/assets/javascripts/views/example_index.js
tagName: 'ul',
render: function () {
  var content = this.template();
  this.$el.html(content);
  var that = this;
  this.collection.each(function (example) {
    var view = new BackboneExample.Views.ExampleItem({ model: example });
    that.$el.append(view.render().$el);
  });
  return this;
}

// app/assets/javascripts/views/example_show.js
tagName: 'li',
render: function () {
  var content = this.template();
  this.$el.html(content);
  return this;
}
