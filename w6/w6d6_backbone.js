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