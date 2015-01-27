module.exports = (gulp, config, $) ->

  # Watch files to rebuild on changes.
  # watching coffee files for recompilation with browserify is done by watchify
  gulp.task 'watch', [ 'localhost' ], ->
    gulp.watch [
      config.path.src + '/*.hbs'
    ], [ 'hbs:watch' ]

    gulp.watch [
      config.path.src + '/sass/**/*.sass'
    ], [ 'sass:watch' ]

    gulp.watch [
      config.path.src + '/**/*.coffee'
      config.path.gulp + '/**/*.coffee'
    ], [ 'lint' ]
