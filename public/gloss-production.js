// Bookmarklet Version 0.3

// User settings
var urlParams = "?token="+window.gloss_token+"&user="+window.gloss_id;

// Set up variables
var pageTitle = document.title;
var pageUrl = window.location.href;

// No Conflict the jQuery
$j = jQuery.noConflict(true);

// Use canonical url if available
var canonicalURL = $j('link[rel=canonical]').attr('href');
if ((canonicalURL != null) && (canonicalURL.substring(0,4) == "http"))
  { pageUrl = canonicalURL; }

// Break paragraphs into spans of class "sentence" 
// (Sentence detection could be refined)

$j('p').each(function() {
  var sentences = $j(this)
    .text()
    .trim()
    .replace(/([A-Z][a-z]?\.)\s?/g, "$1&nbsp;")
    .replace(/(.*?[\.!?]["”]?)(\s|$)/g, '<span class="sentence">$1</span>$2');
  $j(this).html(sentences);
});

$j.ajaxSetup({
  type: "POST",
  contentType: "application/json; charset=utf-8"
});

// Add toggling of highlighting on click

$j('.sentence').on('click', function() {
  if ($j(this).hasClass('highlighted')) {
    // delete highlight
  }
  else {
    var data;
    var highlightedText = $j(this).text();
    var surroundingText = $j(this).parent("p").text();

    data = {
      page_title: pageTitle, 
      page_url: pageUrl,
      selected_text: highlightedText,
      surrounding_text: surroundingText,
      user_id: 1
    };

    $j.post("http://www.glossed.it/highlights.json"+urlParams, 
      JSON.stringify({highlight: data})
    );

    $j(this).addClass('highlighted');

  }
});

// Load highlighting CSS styles

var link = document.createElement("link");
var url = "http://www.glossed.it/bookmarklet.css"
link.type = "text/css";
link.rel = "stylesheet";
link.href = url;

if (document.createStyleSheet) {
    document.createStyleSheet(url);
}
else {
    document.getElementsByTagName("body")[0].appendChild(link);
}