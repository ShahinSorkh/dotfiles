// ==UserScript==
// @name        Pinterest without registration
// @namespace   http://andrealazzarotto.com/
// @version     2.2
// @description Allows to browse Pinterest without login/registration, removing the offending modal popup
// @include     http://*.pinterest.com/*
// @include     https://*.pinterest.com/*
// @include     https://*.pinterest.*/*
// @copyright   2014+, Andrea Lazzarotto
// @require     http://code.jquery.com/jquery-latest.min.js
// @license     GPL version 3 or any later version; http://www.gnu.org/copyleft/gpl.html
// @grant       GM_addStyle
// ==/UserScript==

// Very humble query string extractor
function searchParameter() {
    if (location.href.indexOf('q=') > -1) {
        var result = location.href.split('q=')[1].split('&')[0];
        return decodeURIComponent(result.replace(/\+/g, ' '));
    }
    return;
}

$(document).ready(function () {
	if(location.pathname == "/")
		location.href = "https://www.pinterest.com/categories";

	GM_addStyle(".UnauthBanner, body > .Modal, .ModalManager > .Modal, .Closeup__wrapper > div[style*='fixed'] { display: none !important; } " +
		".noScroll { overflow: auto !important; } " +
		"div[style*='cubic-bezier'], div[style*='fixed']>div[style*='opacity: 0.5'], div[style*='background-color: rgba(0, 0, 0, 0.6);'], .FullPageModal__scroller { display: none !important; } " +
		"div.gridContainer > div, .Grid { height: auto !important; }");
    GM_addStyle(".Header { width: 100%; }");
	GM_addStyle("#desktopWrapper { position: inherit !important}" +
        '.DenzelReactBridge > div > div[style*="opacity: 1"] {display: none !important;}');

	$("body").removeClass("noTouch").css('height', 'auto');
	$('div[data-reactid][style*=fixed]').css('position', 'relative');
	$("#desktopWrapper + * + div").remove();

    // Fix links
    $('.GrowthUnauthPinImage > a[href]').each(function() {
        var link = $(this);
        link.parent().click(function() {
            location.href = link.attr('href');
        });
    });

    // Add simple search form
    var searchForm = $("<form name='search' action='/search/pins/'>" +
                       "<input type='text' name='q' />" +
                       "<button type='submit'>" +
                       "<img style='width: 24px; margin-top: -4px' src='https://i.imgur.com/N7XY1gz.png'>" +
                       "</button></form>");
    searchForm.css('margin-right', '4em').find('input, button').css({
        'height': '40px',
        'line-height': '36px',
        'padding': '0 1em',
        'border': '1px solid #ddd',
        'background': 'white',
        'border-radius': '4px',
        'box-sizing': 'border-box',
        'font-size': '14px'
    });
    searchForm.find('input').val(searchParameter()).css('width', 'calc(100vw - 640px)');
    searchForm.find('button').css({
        'margin-left': '1em',
        'background-color': '#ebebeb',
        'border': 0
    });
    if (!$('input.OpenSearchBoxInput').length)
        $(".UnauthHeader__rightContentContainer").before(searchForm);
});