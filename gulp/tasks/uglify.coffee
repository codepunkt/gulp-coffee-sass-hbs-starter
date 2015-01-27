module.exports = (gulp, config, $) ->
  gulp.task 'uglify', [ 'browserify' ], ->
    gulp.src(config.path.dist + '/js/*.js')
      .pipe($.sourcemaps.init loadMaps: true)
      .pipe($.uglify())
      .pipe($.sourcemaps.write())
      .pipe(gulp.dest config.path.dist + '/js')
