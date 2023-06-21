$(function() {
  var options = [
    "Cerveau Le Wagon",
    "Cerveau Humour",
    "Cerveau Calme",
  ];

  $("#searchInput").autocomplete({
    source: options
  });
});
