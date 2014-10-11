select ids with: #idname

select tags inside an id: #id tagname

select a class name: .class

select elements that have a class of name: tag.classname
or seelect and id with a classname: #id.classname

select multiple elements like an <a> and <p>: a,p

can select all elements or all of one element like <p>: * or *p

select all elements inside of an element type like <a>: a *

can select elements that follow each other like <p> preceeding class="intor": p + .intro

select all elements of a sibling that follows it: A ~ B

select elements that are direct children of other elements: A > B

select the first child inside of another element: element:first-child

select the only child inside an elemen: element:only-child

selects the last child inside another element: ele:last-child

select an element by its order in (a) another element: el:nth-child(a)

and counting from the back: el:nth-last-child(a)

select first element of a type: el:first-of-type

select nth element of a type (a), can use (odd) or (even): el:nth-of-type(a)

selects