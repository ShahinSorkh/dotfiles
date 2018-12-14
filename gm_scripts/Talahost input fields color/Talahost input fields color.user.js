// ==UserScript==
// @name     Talahost input fields color
// @version  1
// @include     http://*.talahost.com*
// @include     https://*.talahost.com*
// @include     http://talahost.com*
// @include     https://talahost.com*
// @include     http://*.talahost.com
// @include     https://*.talahost.com
// @include     http://talahost.com
// @include     https://talahost.com
// @grant    none
// ==/UserScript==


document.body.querySelectorAll('input[type=text],input[type=number],input[type=password],input[type=email],input[type=submit],input[type=button],textarea,select')
	.forEach(function (el) {
  	if (el.classList.contains('form-control') || el.classList.contains('btn')) return
  	el.style.color = window.location.port === '2083' ? 'white':'black'
	})
