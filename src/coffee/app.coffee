template = require './templates/greeter'
logger = require './logger'

document.querySelector('h1').innerHTML = template name: 'World'

window.onerror = logger

document.querySelector('img').addEventListener 'click', (event) ->
  throw new Error 'image click failed'