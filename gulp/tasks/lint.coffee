module.exports = (gulp, config, $) ->
  gulp.task 'lint', ->
    sources = [
      config.path.src + '/**/*.coffee',
      config.path.gulp + '/**/*.coffee'
    ]

    reporterName = if $.util.env.prod then 'failOnWarning' else 'default'

    gulp.src(sources)
      .pipe($.cached config.lint.cacheKey)
      .pipe($.coffeelint())
      .pipe($.coffeelint.reporter reporterName)
      .pipe($.tap config.lint.errorNotifier)
