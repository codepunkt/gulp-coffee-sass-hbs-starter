module.exports = (gulp, config, $) ->
  prod = $.util.env.prod

  gulp.task 'default', [ if prod then 'hbs' else 'watch' ], ->
    gulp.src('/')
      .pipe(if prod then $.notify(
        title: 'Gulp'
        message: 'App build successful'
      ) else $.util.noop())
      .pipe(if prod then $.exit() else $.util.noop())
