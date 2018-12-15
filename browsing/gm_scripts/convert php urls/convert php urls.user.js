// ==UserScript==
// @name     convert php urls
// @version  1
// @grant    none
// ==/UserScript==

var cPhpUrls_getLocation = function(href) {
    var l = document.createElement('a')
    l.href = href
    return l
}

document.querySelectorAll('a')
  .forEach(function (el) {
  	var a = document.createElement('a')
    a.href = el.href
  	if (a.hostname === 'php.net') a.hostname = 'www.php.net'
  	el.href = a.href
})
