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