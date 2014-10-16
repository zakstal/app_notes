---AJAX---

AJAX -- "asynchronous JavaScript and XML"

 It uses a browser''s built-in XMLHttpRequest (XHR) unctionality to make a
 request to the server and then handle the data that the server returns.

 We can use the jQuery $.ajax() method in a couple of different ways


 The term AJAX was coined in 2005 to describe a method for retrieving data
 from a server without requiring a page refresh.

If you need to create a JSON string from a JavaScript object, or if you need
to parse a JSON string outside of jQuery, modern browsers provide the
JSON.stringify() and JSON.parse() methods. This functionality can be added
to older browsers using the json2.js library. jQuery also provides the
jQuery.parseJSON method, which provides the same functionality as JSON.parse()
across all browsers. However, jQuery does not provide a method that corresponds
to JSON.stringify().


jQuery provides several "convenience methods" that let us use an abbreviated
syntax. Each of these methods takes a URL, an optional data object, and
an optional callback for handling a successful request.

.serialize() method for taking form input and converting it to a query string
format (field1name=field1value&field2name=field2value...):

$.ajax() (and related convenience methods) returns a jqXHR object — a
jQuery XML HTTP Request — which has a host of powerful methods. We can
make a request using $.ajax(), and then capture the returned jqXHR object
in a variable.

 we can use the .then() method of the jqXHR object to attach success and error
 callbacks. The .then() method takes one or two functions as its arguments

If we don''t want to attach success and error callbacks at the same time, we
can use the .done() and .fail() methods of the request object.

req.done( success );
req.fail( err );

As it turns out, for security reasons, XHRs to other domains are blocked by
the browser. However, certain third-party APIs provide a response formatted
as JSONP — "JSON with Padding" — which allows you to use their data even
though it is hosted on another server.

Nevertheless, jQuery lets you make a JSONP request with $.ajax() by specifying
'jsonp' as the dataType in the configuration object.

$.ajax({
  url: '/data/search.jsonp',
  data: { q: 'a' },
  dataType: 'jsonp',
  success: function( resp ) {
    $( '#target' ).html( 'Results: ' + resp.results.length );
  }
});

CORS — cross-origin resource sharing

Deferreds provide a means to react to the eventual success or failure of an
asynchronous operation, and reduce the need for deeply nested callbacks.

$.Deferred()

.then(), .done(), .fail(), .always()

We can use the .pipe() method of a promise to react to the resolution of an
asynchronous operation by manipulating the value it returns and creating a
new deferred.
As of jQuery 1.8, the .then() method of a promise behaves like .pipe().

for example, if a function does something async the first time it runs, and
then caches the value for future use. In this case, we can use $.when() to
react to either case.

---Basic AJAX---


ajax allows you to make server requests in the background.


$.ajax (low-level, complete interface)
  I only use this one, actually.
$.get ("more convenient" function for GET requests)
$.post ("more convenient" function for POST requests)


---AJAX Remote Forms---

serialize

Should you ever explicitly need the CSRF token, you can do what rails.js does to look it up:

$('meta[name="csrf-token"]').attr('content');

---Underscore templates---


<ul id="my_list">
</ul>

<script type="application/javascript">
  var $ul = $("#my_list");
  _.times(3, function () {
    $ul.append("<li>One more time!</li>")
  });
</script>

?: what is _.times

Underscore can render templates client-side

<script type="text/template" id="widgets_template">
  <ul>
    <% _(widgets).each(function (widget) { %>
      <li>
        <%= widget.name %> -- <%= widget.price %>
      </li>
    <% }); %>
  </ul>
</script>
The contents of the script tag look like ERB. That''s because Underscore
templates are intended to mimic ERB.

he text/template script type tells the browser that this is not JavaScript
and it should not try to execute the template as if it were JS code.

We can fix him. We have the technology. Just use <%% which "escapes" the % sign:

<!-- app/views/widgets/show.html.erb -->
<h1><%= @widget.name %></h1>

<script type="text/template" id="silly_template">
  <ul>
    <%% _.times(3, function () { %>
      <li>Three cheers for widgets!</li>
    <%% }); %>
</script>

<script type="application/javascript">
  // code to render and inject the template
</script>
