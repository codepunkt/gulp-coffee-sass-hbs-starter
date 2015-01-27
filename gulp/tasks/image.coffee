module.exports = (gulp, config, $) ->
  gulp.task 'image', [ 'clean' ], ->
    gulp.src(config.path.src + '/images/*')
      .pipe(if $.util.env.prod then $.imagemin() else $.util.noop())
      .pipe(gulp.dest config.path.dist + '/images')
