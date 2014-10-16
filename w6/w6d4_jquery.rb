---Event Delegation: With a Little Help From jQuery---

Writing event delegation like this can be tricky and cause bugs. jQuery helps us by also giving us the three-argument version of jQuery#on(event, selector, callback):


---jQuery Part VII: Triggering---

<script>
  $("div.hover-submit-inner").on("mouseenter", function (event) {
    timerId = window.setTimeout(function () {
      console.log("mouseenter");
      var $div = $(event.currentTarget);

      var timerId = window.setTimeout(function () {
        $div.closest("form").trigger("submit");
      }, 2000);
      $div.data("timer-id", timerId);
    })
  });
  $("div.hover-submit-inner").on("mouseleave", function () {
    console.log("mouseleave");
    var $div = $(event.currentTarget);

    window.clearTimeout($div.data("timerId"));
    $div.data("timer-id", null);
  });
</script>

---Advanced Plugin Concepts---

?: I dont fully understand the each in below

$.fn.hilight = function( options ) {

    // Iterate and reformat each matched element.
    return this.each(function() {

        var elem = $( this );

        // ...

        var markup = elem.html();

        // Call our format function.
        markup = $.fn.hilight.format( markup );

        elem.html( markup );

    });

};

// Define our format function.
$.fn.hilight.format = function( txt ) {
    return "<strong>" + txt + "</strong>";
};


One real-world example is the Cycle Plugin.
he Cycle Plugin is a slideshow plugin which supports a number of built-in
transition effects – scroll, slide, fade, etc.



1
2
3
4
5
$.fn.cycle.transitions = {

    // ...

};
This technique makes it possible for others to define and ship transition
definitions that plug-in to the Cycle Plugin.

?: does this overwrite the transistion inside?

So how then do we define more functions without cluttering the namespace and
without exposing the implementation? This is a job for closures.

