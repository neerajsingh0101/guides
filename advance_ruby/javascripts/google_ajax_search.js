google.load("search", "1");

function OnLoad() {
  // Create a search control
  var searchControl = new google.search.SearchControl();
  // Add in a WebSearch
  var webSearch = new google.search.WebSearch();
  // Restrict our search to pages from this site
  webSearch.setSiteRestriction('tagaholic.me');
  
  var options = new google.search.SearcherOptions();
  options.setExpandMode(google.search.SearchControl.EXPAND_MODE_OPEN);
  // Add the searcher to the SearchControl
  searchControl.addSearcher(webSearch, options);
  
  // tell the searcher to draw itself and tell it where to attach
  searchControl.draw(document.getElementById("search"));
}
google.setOnLoadCallback(OnLoad);