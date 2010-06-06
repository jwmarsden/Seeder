<div id="overlay"></div>
<script type='text/javascript'>
var overlay  = {
    status:0,
    show: function() {
      var body = $("body");
      $("#overlay").width(body.width()).height(body.height()).show();
    },
    hide: function() {
      $("#overlay").hide();
    }
}
</script>