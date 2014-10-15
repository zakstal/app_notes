---The Document Object Model (DOM)---

document.getElementById(selector)
Returns a single Element matching the id.

document.getElementsByClassName(selector)
Returns an Array-like object of type NodeList that contains all Elements
matching the class name.

document.querySelectorAll(selector)
Returns a NodeList of Elements matching the CSS selector.


Events are the means by which JavaScript can react to user behavior. Some common events:

click, dblclick
input, change, submit
keydown, keyup
mouseover, mousemove, mouseout
scroll, resize
MDN, as ever, has a full list of DOM Events.
.addEventListener("submit",fuction)

---jQuery Part I: Selection and Manipulation---

jQuery and $ means the same thing.

a jquery object is an array of HTMLELements

document.querySelectorAll("li") returns a NodeList

jQuery#addClass are jQuery#removeClass

(function () {
  var $ul = $("ul");
  $ul.children().attr("style", "background-color: red");
  $ul.parent().attr("style", "background-color: green");
  $ul.siblings().attr("style", "color: blue");
})();
</script>
jQuery methods typically return jQuery objects: #parent, #children, and #siblings all return jQuery objects. This allows you to chain jQuery methods. If methods returned a NodeList we would need to drop back down to the DOM API.


We''ve seen the jQuery#attr(name, value) and jQuery#text(value) setter methods. There is a corresponding jQuery#val(value) method to set the value of an input tag.


---jQuery Part II: Events---

We saw how to use EventTarget#addEventListener. Now we'll see the jQuery way: jQuery#on(eventName, callback):

You can call jQuery#off(eventName) to remove all callbacks for that event, but it is more common to use jQuery#off(eventName, callback) to remove just one callback for the event.

The only way the event handler knows which list item is being moused over is through event.currentTarget. event.currentTarget is always an HTMLElement, it is common to create a jQuery object wrapping event.currentTarget so we can use jQuery methods.

---jQuery Part III: $(document).ready---

only allow jquery to run after the dom has fully loaded.

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.js"></script>

<script>
  // jQuery will call the function only after the DOM is fully loaded.
  // The anonymous function **is not** called right at this point.
  $(function () {
    $("ul.cool-things > li").attr("style", "background-color: red");
  });
</script>


<ul class="cool-things">
  <li>Racecars</li>
  <li>Lasers</li>
  <li>Aeroplanes</li>
</ul>


another way to say $(function()) is:

$(document).ready(function () { ... }).

---jQuery Part IV: All The Ways---

Let''s review all the ways that $ can be used:

Selector-style
$("ul.cool-things")
Takes in a CSS selector.
Returns a jQuery object containing all elements matching that selector.
HTML-style
$("<li>Racecars</li>")
Takes in a string of HTML code.
Builds HTMLElements for the content, returns a jQuery object containing the top-level elements you built.
Wrapper-style
$(nativeDomElement), $(arrayOfDomElements)
Takes in an unwrapped HTMLElement or array of several elements.
Returns a jQuery wrapping those, giving you access to the jQuery methods.
Ready-style
$(function () { ... })
Takes a function to run when the DOM is fully loaded; does not run it yet.
Returns nothing.

---jQuery Part V: Data Attributes---

Object.keys(DOGS).forEach(function (id) {
   var dog = DOGS[id];

   ?: what is event.currentTarget;

   Here, when we call jQuery#data, it will pull the initial data value out of the DOM. T
