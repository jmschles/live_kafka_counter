// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

const timeout = 5000
const pollingButton = document.getElementById('polling-button')
let keys = []
let polling = false
let beginPolling

function getNewCount() {
  fetch('/kc/fetch')
    .then(response => response.text())
    .then(value => document.getElementById('count').innerHTML = value)
}

document.addEventListener('keydown', function(e) {
  keys.push(e.keyCode)
  if (keys.length > 2) { keys.shift() }

  // ugh javascript
  if (keys[0] == 17 && keys[1] == 81) { fetch('/kc/increment') }
  if (keys[0] == 17 && keys[1] == 65) { fetch('/kc/decrement') }
})

pollingButton.addEventListener('click', function(e) {
  if (polling) {
    polling = false
    clearInterval(beginPolling)
    pollingButton.innerHTML = 'This is exciting, I want live updates!'
  } else {
    polling = true
    beginPolling = setInterval(getNewCount, timeout)
    pollingButton.innerHTML = 'Stop polling for live updates.'
  }
})