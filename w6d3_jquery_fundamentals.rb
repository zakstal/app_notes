---JavaScript Basics---

When you call the $() function and pass a selector to it, you create a new jQuery object.

Of course, in JavaScript, functions are objects too, so that means that $ (and jQuery, of course) has properties and methods, too.

$(document).ready()
Before you can safely use jQuery to do anything to your page, you need to ensure that the page is in a state where it''s ready to be manipulated.

get an element

$( '#header' ); // select the element with an ID of 'header'
$( 'li' );      // select all list items on the page
$( 'ul li' );   // select list items that are in unordered lists
$( '.person' ); // select all elements with a class of 'person'



In addition to passing a simple selector to $(), you can create jQuery objects in a few other ways:


// create a jQuery object from a DOM element
$( document.body.children[0] );

// create a jQuery object from a list of DOM elements
$( [ window, document ] );

// make a selection in the context of a DOM element
var firstBodyChild = document.body.children[0];
$( 'li', firstBodyChild );

// make a selection within a previous selection
var paragraph = $( 'p' );
$( 'a', paragraph );

if ( $( '#nonexistent' ).length ) {
  // This code will only run if there''s a matching element
}

var listItems = $( 'li' );
var rawListItem = listItems[0]; // or listItems.get( 0 )
var html = rawListItem.innerHTML;

you can get a new jQuery object containing a single element by using .eq() and passing the index of the element you''re after.

var listItems = $( 'li' );
var secondListItem = listItems.eq( 1 );
secondListItem.remove();

Let''s say that you want to change the HTML of all of the list items on your page. To do this, we''d use the .html() method, which will change the HTML of all of the selected list items.

$( 'li' ).html( 'New HTML' );

---Traversing & Manipulating---

<ul>
    <li>
        <span>
            <i>Foo</i>
        </span>
    </li>
    <li>Bar</li>
</ul>
The first list item is a child of the unordered list.
The unordered list is the parent of both list items.
The span is a descendant of the unordered list.
The unordered list is an ancestor of everything inside of it.
The two list items are siblings.

var listItems = $( 'li' );



// filter the selection to only items with a class of 'special'
var special = listItems.filter( '.special' );

// filter the selection to only items without a class of 'special'
var notSpecial = listItems.not( '.special' );

// filter the selection to only items that contain a span
var hasSpans = listItems.has( 'span' );

Importantly, note that .not() is not the opposite of .is(). The .is() method returns a boolean, while the .not() method returns a new jQuery object.

// get the first list item on the page
var listItem = $( 'li' ).first(); // also: .last()

// get the siblings of the list item
var siblings = listItem.siblings();

// get the next sibling of the list item
var nextSibling = listItem.next(); // also: .prev()

// get the list item''s parent
var list = listItem.parent();

// get the list items that are immediate children of the list
var listItems = list.children();

// get ALL list items in the list, including nested ones
var allListItems = list.find( 'li' );

// find all ancestors of the list item that have a class of "module"
var modules = listItem.parents( '.module' );

// find the closest ancestor of the list item that has a class of "module"
var module = listItem.closest( '.module' );

You can also add to an existing selection by using the .add() method. You can pass it a selector, an array of elements, a string of HTML, or a jQuery object.

If your use case requires adding and removing a class repeatedly, jQuery provides the .toggleClass() method. The following code adds the class hidden if it is not present, and removes it if it is present.

Whenever possible, you should use classes combined with CSS rules to affect the presentation of elements, and use jQuery only to add and remove those classes as shown above. In this section, we''ll see how to alter the style of an element directly, but CSS rules combined with classes are always preferable if they can achieve the desired effect.

jQuery provides the .css() method to allow you to set the style of elements directly.


For checkbox input elements, you''ll need to set the checked property on the element using the .prop() method.

$( 'input[type="checkbox"]' ).prop( 'checked', 'checked' );


You can also remove attributes entirely using .removeAttr().

You could append the item to the list by calling .appendTo() on the list item:

You could insert the list item after the last list item by calling .insertAfter() on the list item that you want to move:


You could also insert the list item after the last list item by calling .after() on the last list item:

You can make a copy of an element or a set of elements using jQuery''s .clone() method.  This will make a copy of the elements, but note that the copy is only in memor


There are three ways to remove elements from the document: .remove(), .detach(), and .replaceWith(). Each method serves a particular purpose.
