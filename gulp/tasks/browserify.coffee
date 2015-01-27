browserify = require 'browserify'
browserSync = require 'browser-sync'
watchify = require 'watchify'
exorcist = require 'exorcist'
coffeeify = require 'coffeeify'
hbsfy = require 'hbsfy'
source = require 'vinyl-source-stream'
_ = require 'lodash'

module.exports = (gulp, config, $) ->
  gulp.task 'browserify', [ 'clean', 'lint' ], ->
    errorHandler = if $.util.env.prod
      'throwError'
    else
      'logError'

    bundle = ->
      app.bundle()
        .on('error', config.base[ errorHandler ])
        .pipe(source 'app.js')
        .pipe(gulp.dest config.path.dist + '/js')
        .pipe(browserSync.reload stream: true)

    app = browserify(
      config.path.src + '/coffee/app.coffee',
      _.defaults config.browserify, watchify.args
    )

    app.transform coffeeify
    app.transform hbsfy
    app = watchify app
    app.on 'update', bundle

    bundle()
