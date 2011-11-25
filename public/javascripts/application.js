// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#orders th a, #orders .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#orders_search input").keyup(function() {
    $.get($("#orders_search").attr("action"), $("#orders_search").serialize(), null, "script");
    return false;
  });
});