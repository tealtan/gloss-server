// Bookmarklet Version 0.1

// Set up variables
var pageTitle = document.title;
var pageUrl = window.location.href; // TODO: Search for canonical URL

// No Conflict the jQuery
$j = jQuery.noConflict(true);

// Break paragraphs into spans of class "sentence" 
// (Sentence detection could be refined)

$j('p').each(function() {
  var sentences = $j(this)
    .text()
    .replace(/([^.!?]*[^.!?\s][.!?]['"]?)(\s|$)/g, '<span class="sentence">$1</span>$2');
  $j(this).html(sentences);
});

$j.ajaxSetup({
  type: "POST",
  contentType: "application/json; charset=utf-8",
  headers: {
    'X-CSRF-Token': "Vg3/I/0ToEZbXw2MBnlXdwdDiHu39QNbLyVPW5FVQRA="
  }
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

    $j.post("http://localhost:3000/highlights.json", 
      JSON.stringify({highlight: data})
    );

  }
  $j(this).toggleClass('highlighted');
});

// Load highlighting CSS

var link = document.createElement("link");
var url = "http://tanmade.com/making/gloss-v2/gloss.css"
link.type = "text/css";
link.rel = "stylesheet";
link.href = url;

if (document.createStyleSheet) {
    document.createStyleSheet(url);
}
else {
    document.getElementsByTagName("body")[0].appendChild(link);
}