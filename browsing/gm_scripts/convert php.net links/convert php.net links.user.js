// ==UserScript==
// @name     convert php.net links
// @version  1
// @grant    none
// ==/UserScript==

document.querySelectorAll('a[href]').forEach(function (el) {
  if (el.hostname === 'php.net') {
    el.hostname = 'www.php.net'
  }
})
