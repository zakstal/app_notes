---What is a model?---

So for the purpose of the tutorial let''s create a model.

Person = Backbone.Model.extend({
        initialize: function(){
            alert("Welcome to this world");
        }
    });

    var person = new Person;

    passing a javascript object to our constructor is the same as calling model.set().

    modelge() we can access model properties

    Person = Backbone.Model.extend({
      initialize: function(){
        alert("welcome");
      }
    })

    var person = new Person({ name: "THomas", age: 67})

    var age = person.get("age");

    can set a property name defaults in your model

    Person = Backbone.Model.extend({
    defaults: {
      name: "me",
      age: 31
    }
    initialize: function(){
      alert("welcome");
    }
  });

  can set methods
  this.set({name: "zak"});

  all attributes of a model can have listeners bound to them to detect changes in value

  Person = Backbone.Model.extend({
          defaults: {
              name: 'Fetus',
              age: 0
          },

          initialize: function(){
            alert("welcome");
            this.on("change:name", function(model){
              var name = model.get("name");
            })
          }
  });


  Models are used to represent data from your server and actions you
  perform on them will be translated to RESTful operations.

  ?:surrogate key

  the id attribute of a model identitfies how to find it on the database

  var UserModel = Backbone.Model.extend({
    urlRoot: '/user',
  defaults: {
    name: '';
    email: '';
  }
  });

  to create a new user on the server call save

  var user = new Usermodel();
    // Notice that we haven't set an `id`
    var userDetails = {
        name: 'Thomas',
        email: 'thomasalwyndavis@gmail.com'
    };
    // Because we have not set a `id` the server will call
    // POST /user with a payload of {name:'Thomas', email: 'thomasalwyndavis@gmail.com'}
    // The server should save the data and return a response containing the new `id`
    user.save(userDetails, {
        success: function (user) {
            alert(user.toJSON());
        }
    })

    to get a user from the db
    instantiate a new user model with the id

    var user = new Usermodel({id: 1});

    and use fetch

    user.fetch({
      success: fucntion (user) {
        alert(user.toJSON();)
      }
    });

    ?: what is user.toJSON() do


    to update use save. if an id is present it will send a put instead of a post

    can use destroy to if a user has an id

    user.destroy({
      success: function (){
        alert('Destroyed');
      }
    });

    to get a copy of the current attributes

    var person = new Person({ name: "thomas", age: 67});
    var attributes = person.toJSON(); //{ name: "thomas", age: 67}


    can make validations. if you returnaa string from the validat function
    backbone will throw an error

    Person = Backbone.Model.extend({
      validate: function(attribues){

      }
    })

    ---What is a view?---

    SearchView = Backbone.View.extend({
            initialize: function(){
                alert("Alerts suck.");
            }
        });

        The "el" property references the DOM object created in the browser.
        Every Backbone.js view has an "el" property, and if it not defined,
        Backbone.js will construct its own, which is an empty div element.

        <div id="search_container"></div>

        <script type="text/javascript">
            SearchView = Backbone.View.extend({
                initialize: function(){
                    alert("Alerts suck.");
                }
            });

            var search_view = new SearchView({ el: $("#search_container") });
        </script>

        add a render function to call underscore files

        and event listener to the view

        SerarchView = Backbone.View.extend({
          initialize: funciton(){
            this.render()
          },
          render: function(){
            var template = _.template( $("#serch_template").html(). {});
            this.$el.html(template);
          },
          events: {
            "click input[type-button]": "doSearch"
          },

          doSearch: function( event ){
            alert("Search for " + $("#search_input").val() );
          }
        });

        var search_view = new SearchView({ el: $("search_container") });

        <script type="text/template" id="search_template">
            <!-- Access template variables with <%= %> -->
            <label><%= search_label %></label>
            <input type="text" id="search_input" />
            <input type="button" id="search_button" value="Search" />
        </script>

        <div id="search_container"></div>

        <script type="text/javascript">
             SearchView = Backbone.View.extend({
                initialize: function(){
                    this.render();
                },
                render: function(){
                    //Pass variables in using Underscore.js Template
                    var variables = { search_label: "My Search" };
                    // Compile the template using underscore
                    var template = _.template( $("#search_template").html(), variables );
                    // Load the compiled HTML into the Backbone "el"
                    this.$el.html( template );
                },
                events: {
                    "click input[type=button]": "doSearch"
                },
                doSearch: function( event ){
                    // Button clicked, you can access the element that was clicked with event.currentTarget
                    alert( "Search for " + $("#search_input").val() );
                }
            });

            var search_view = new SearchView({ el: $("#search_container") });
        </script>


---What is a router?---

Defined routers should always contain at least one route and a function to
map the particular route to.


Also note that routes interpret anything after "#" tag in the URL. All links in your application should target "#/action" or "#action". (Appending a forward slash after the hashtag looks a bit nicer e.g. http://example.com/#/user/help)

var AppRouter = Backbone.Router.etend({
  routes: {
    "*actions": "defaultRoute"
  }
});

var app_router = new AppRouter;

app_route.on('route:defaultRoute', function(actions){
  alert(ation)
});

// Start Backbone history a necessary step for bookmarkable URL's
Backbone.histroy.start()

var AppRouter = Backbone.Router.extend({
        routes: {
            "posts/:id": "getPost",
            "*actions": "defaultRoute" // Backbone will try match the route above first
        }
    });
    // Instantiate the router
    var app_router = new AppRouter;
    app_router.on('route:getPost', function (id) {
        // Note the variable in the route definition being passed in here
        alert( "Get post number " + id );
    });
    app_router.on('route:defaultRoute', function (actions) {
        alert( actions );
    });
    // Start Backbone history a necessary step for bookmarkable URL's
    Backbone.history.start();
    ?:dynamic and static content


    two style of variables when implatmenting routs
    ":params" - match any URL components between slashes.
    "*splats" - which match any number of URL components.

A route defined as "/:route/:action" will pass 2 variables
(“route” and “action”) to the callback function.

routes: {
  "posts/:id": "getPost:",
  // <a href="http://example.com/#/posts/121">Example</a>

  "download/*path": "downloadFile",
  // <a href="http://example.com/#/download/user/images/hey.gif">Download</a>

  ":route:action": "loadView",
  // <a href="http://example.com/#/dashboard/graph">Load Route/Action View</a>

},

app_router.on('rout:getPost', function( id ) {
  alert(id);
});

app_router.on('route:downloadFil', function( path ){
  alert(path);
});

app_router.on('route:loadView', function( path, action ){
  alert(route + "_" + action);
});

---What is a collection?---




var Song = Backbone.Model.extend({
      initialize: function(){
          console.log("Music is the answer");
      }
  });

  var Album = Backbone.Collection.extend({
    model: Song
  });


  ---Backbone.Model---

  Models contain the data of our application as well as any logic surrounding it including 
  conversions, validations and computed properties. We will extend Backbone.Model to get basic 
  functionality for managing and listening to changes to the data.

boneExample.Models.Example = Backbone.Model.extend({});

backbone models can have an initialize that tacke json attributes as args

Like ActiveRecord models, all the essential data for a Backbone model is stored 
in an internal object called attributes and has get and set methods

When model data is being displayed in a view prefer escape over get as it will safely 
html escape data.

console.log(example.get('title')); // => "<script>hack()</script>"
// safer
console.log(example.escape('title')); // => "&lt;script&gt;hack()&lt;&#x2F;script&gt;"


The id attribute is used to determine if a model isNew or not 

cid is an attribute added to all Models and is used to uniquely identify Models on the client side

?: cid

Backbone Model Method makes this HTTP request that  calls this Rails controller method
save on a model with no id  POST  controller#create
save on a model that has an id  PUT controller#update
save on model with id using { patch: true } option  PATCH controller#update
fetch on a model that has an id GET controller#show
destroy on a model that has an id DELETE  controller#destroy

?: urlRoot:


SAVE:

save is a method that will make a $.ajax request to your rails controller 
using the model url or urlRoot attribute. It will either make a 


var example = new BackboneExample.Models.Example();
example.save({ title: "Example title" }, {
  success: function(model, response, options){
  //the success callback recieves the model itself as it's first argument
  },

  If you have already set the attributes on the model, then just pass an
  empty object as the first argument.

  FETCH:

  fetch, when called on a Backbone model which has an id, will make an 
  $.ajax request that goes to the controller's show method.

  var example = new BackboneExample.Models.Example({ id: 1 });
// The model must have an id - otherwise Rails doesn't know what to fetch
example.fetch({
  success: function(model, response, options){
  //the success callback recieves the model itself as it's first argument
  },


DESTROY:

destroy makes an $.ajax request of type DELETE, hitting your 
Rails controller''s destroy method and deleting the record from your Rails database.

---Backbone.Collection---

Collections wrap sets of models, adds underscore.js methods and enables binding to 
events for notifications as things change in the collection.

Basic collection setup:

BackboneExample.Collections.Examples = Backbone.Collection.extend({
  model: BackboneExample.Models.Example,
  url: "/api/examples",
  initialize: function (attribute) {}
});

model

The model property specifies the model class that the collection contains. 
Defining this attribute allows us to pass raw attributes, and arrays of 
raw attributes when creating collections and the attributes will be converted 
to models of the proper type.

url

The url method of the collection defines the location of the RESTful resource on the server. 
This will be the route to our rails api for the index action of that resource.

// ?: is this the rails routes? or backbone routes

Collection methods and the things they do (summary)

Some backbone collection methods provide convenient wrappers for making common $.ajax requests:

Backbone Collection Method  makes this HTTP request that  calls this Rails controller method
fetch                     GET    controller#index
create passing in a hash 
of new model attributes   POST  controller#create (and on success, adds new model to Backbone collection.)


fetch

fetch is an async operation that will send an $.ajax request to url to get models from the server. 
fetch takes an optional options hash that may include success and error callbacks.

create

create is also an async operation, and it sends an $.ajax POST request to url, 
creating an instance of the model, as well as adding it to the collection. 
It is equivalent to creating a model, calling save on the model, and then adding 
it to the collection in the success callback for save.

---Backbone.Router---

Backbone.Router provides methods for routing our client-side pages. 
Each route will be mapped to a method in our router. 
Make sure to call Backbone.history.start() in your app initialize, s
o that the router can listen for changes in the URL fragment.

Routes can contain parameters prefixed with colon, similar to symbols in rails. Check this out:

routes: {
  '': 'index',
  'examples/new': 'new',
  'examples/:id': 'show',
  'examples/:id/edit': 'edit'
},
index: function () {},
show: function (id) {},
new: function () {},
edit: function (id) {}


Notice:

routes do not start with /
trailing / will fire different routes (docs != docs/)


---Backbone.View---

Backbone.Views are used to organize the user interface into logical views that are 
backed by data (models or collections). The best pattern to follow is to allow your 
view to render (without redrawing the entire page) 
whenever the data the view backs changes.


Setup

At a minimum an index view will look like this:

BackboneExample.Views.ExamplesIndex = Backbone.View.extend({
  template: JST['examples/index'],
  render: function () {
    var content = this.template({ examples: this.collection });
    this.$el.html(content);
    return this;
  }
});

template

The template property of a Backbone.View is a good place to store a template function. 
We will be using JST (javascript templates) but you could use any templating engine here. 
template takes an object where the keys will specify the names of the local variables 
and the values are the values of the variables. Lucky for us, 
JST looks and feels just like ERB.

render

One primary responsiblity of a view is to "render" content into an element on the DOM. render should:

Compile the template into content
Inject the content into the $el using html or append (we''ll look at $el in a sec)
return this. (by returning the view we can have convenient chaining)

initialize

initialize can take several special options that will be directly 
attached to the view if passed. Special options that we will pass 
most commonly are collection and model. NB: The initialize method 
will be used for setup of the views listeners. 
Prefer passing an options hash opposed to individual params to initialize.

$el and el

el will by default be created as an empty div. el will hold a reference 
to the html element, while $el will hold a cached jQuery object 
for the view''s html. Prefer using the $el as it will have all of 
  the jQuery methods we''ve grown to know and love.


events

The events hash is used with jQuery''s on function to register 
callbacks to DOM events. The event hash should look like this:

events: {
  'event selector': 'callbackName'
}

---Backbone.Event---

Backbone.Events is a module that can be mixed in to any object. 
Many of the Backbone objects mixin Events and give the object the 
ability to bind and trigger events. There are a few built in 
events and you can create custom named events.


listenTo

listenTo tells an object to listen to an event on another object 
and fire a callback when that event occurs. Let''s take a look.


listenTo will automatically bind this to the context of the 
object that is listening for the callback

Built-in Events (from backbone docs)

"add" (model, collection, options) — when a model is added to a collection.
"remove" (model, collection, options) — when a model is removed from a collection.
"reset" (collection, options) — when the collection's entire contents have been replaced.
"sort" (collection, options) — when the collection has been re-sorted.
"change" (model, options) — when a model's attributes have changed.
"change:[attribute]" (model, value, options) — when a specific attribute has been updated.
"destroy" (model, collection, options) — when a model is destroyed.
"request" (model, xhr, options) — when a model (or collection) has started a request to the server.
"sync" (model, resp, options) — when a model (or collection) has been successfully synced with the server.
"error" (model, xhr, options) — when a model's save call fails on the server.
"invalid" (model, error, options) — when a model's validation fails on the client.
"route:[name]" (params) — Fired by the router when a specific route is matched.
"route" (route, params) — Fired by the router when any route has been matched.
"route" (router, route, params) — Fired by history when any route has been matched.
"all" — this special event fires for any triggered event, passing the event name as the first argument.


?: when calling comments new does it automatically render prepare the template?
?: todos_index.j line 27 what is this.template being passed with todos? why pass it?
?: todos_index.js line 34 why is _titleLowerCase, is it underscore?
?: todos_new.js line 10 why this.$el.html(renderedContent); and not $("body").html(newView.render().$el); like in app_router.js line 37
