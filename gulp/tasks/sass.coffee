reload = require('browser-sync').reload

module.exports = (gulp, config, $) ->
  sass = ->
    args = if $.util.env.prod then [ '.', includeContent: true ] else []
    $.rubySass(config.path.src + '/sass/app.sass', config.sass)
      .on('error', config.base.throwError)
      .pipe($.autoprefixer config.autoprefixer)
      .pipe($.sourcemaps.write.apply null, args)
      .pipe(gulp.dest config.path.dist + '/css')
      .pipe(reload stream: true)

  gulp.task 'sass', [ 'clean' ], sass
  gulp.task 'sass:watch', sass
