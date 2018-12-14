// ==UserScript==
// @name        Rotten Tomatoes Link On IMDb
// @namespace   https://github.com/Ede123/userscripts
// @version     1.2.2
// @description Adds a direct link to the corresponding Rotten Tomatoes movie description page for every IMDb movie
// @icon        https://raw.githubusercontent.com/Ede123/userscripts/master/icons/Rotten_Tomatoes.png
// @author      Eduard Braun <eduard.braun2@gmx.de>
// @license     GPL-3.0+; http://www.gnu.org/copyleft/gpl.html
// @include     http://www.imdb.com/title/tt*
// @include     https://www.imdb.com/title/tt*
// @noframes
// @grant       GM_xmlhttpRequest
// ==/UserScript==

// get IMDb movie ID
var IMDbID_RegEx = /\/title\/(tt\d{7})\//;
var IMDbID = IMDbID_RegEx.exec(window.location.href)[1];


// function to add the Rotten Tomatoes button
var GM_addButton = function(link) {

	// icon
	var RT_icon = document.createElement('img');
  // RT_icon.src = "http://www.rottentomatoes.com/favicon.ico";
	// RT_icon.src = "https://staticv2.rottentomatoes.com/static/images/icons/favicon.ico";
	// RT_icon.src = "https://rottentomatoes.com/static/images/icons/favicon.ico";
	// RT_icon.src = "https://staticv2-4.rottentomatoes.com/static/images/icons/favicon.ico";
  // RT_icon.src = "https://imge.androidappsapk.co/115/c/4/3/com.pixelnet.rottentomatoes.png";
  RT_icon.src = "https://raw.githubusercontent.com/Ede123/userscripts/master/icons/Rotten_Tomatoes.png";
  RT_icon.alt = "rotten tomatoes";
  RT_icon.height = 32;

  // link
  var RT_link = document.createElement('a');
  RT_link.href = link;
  RT_link.target = "_blank";
  RT_link.appendChild(RT_icon);

  // icon container
  var RT_container = document.createElement('div');
  RT_container.classList.add('titleReviewBarSubItem');
  RT_container.appendChild(RT_link);

  // vertical divider
  var divider = document.createElement('div');
  divider.classList.add('divider');

  //add link to IMDb movie page
  var reviewBar = document.querySelector(".titleReviewBar");
  if (reviewBar) {
		reviewBar.appendChild(divider);
		reviewBar.appendChild(RT_container);
	}
};

// get Rotten Tomatoes movie alias from Rotten Tomatoes API
fetch("http://www.omdbapi.com/?apikey=1599db29&tomatoes=true&i=" + IMDbID)
	.then(function(response) { return response.json(); })
	.then(function(json) {
  	if (json && json.tomatoURL && json.tomatoURL != "N/A") {
  		console.info("rotten tomatoes url:", json.tomatoURL);
			GM_addButton(json.tomatoURL);
		} else if (json && json.Error) {
			console.log("Error: " + json.Error);
		}
	})
	.catch(function(error) { console.error(error); });
