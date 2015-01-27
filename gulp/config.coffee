url = require 'url'
util = require 'gulp-util'
dist = './dist'
src = './src'
gulp = './gulp'

module.exports =
  path:
    dist: dist
    gulp: gulp
    src: src

  autoprefixer:
    browsers: '> 5% in DE'

  browserify:
    debug: true
    extensions: [ '.coffee', '.hbs' ]

  lint:
    cacheKey: 'lint'
    errorNotifier: require './util/error-notifier'

  localhost:
    server:
      baseDir: dist
      middleware: (req, res, next) ->
        if url.parse(req.url).pathname.indexOf('.') is -1
          req.url = '/index.html'
        next();
    https: false
    open: false

  sass:
    sourcemap: true
    style: 'compressed'

  base:
    logError: (err) ->
      util.log err.message
      this.emit 'end'
    throwError: (err) ->
      throw err
