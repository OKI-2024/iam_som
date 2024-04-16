
document.addEventListener("turbo:load", function() {
  $('#wine_search').autocomplete({
    source: '/wines/autocomplete',
    minLength: 3,
    select: function(event, ui) {
      $('#wine_search').val(ui.item.value);
      return false;
    }
  });
});
