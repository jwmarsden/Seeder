<link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'seeder.css')}" />
<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<g:javascript library="jquery" />
<g:javascript library="seeder" />
<g:javascript library="application" />
<g:layoutHead />
<jq:jquery>
  $(document).ready(function() {
    /************************************
    ** General Input Field Events
    ************************************/
    $("input, textarea").hover(function () {$(this).addClass("hoverInput");},function () {$(this).removeClass("hoverInput");});
    $("input, textarea").focus(function() {$(this).addClass("activeInput").removeClass("idle");}).blur(function(){$(this).removeClass("activeInput").addClass("idle");});
  });
</jq:jquery>