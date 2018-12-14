// ==UserScript==
// @name     Yahoo mailbox right sidebar blocker
// @match    *://mail.yahoo.com/*
// @version  1
// @grant    none
// ==/UserScript==

function removeSidebar() {
	var sidebar = document.querySelector('[data-test-id="mail-right-rail"]')
	sidebar.remove()
}

setInterval(removeSidebar, 3000)
