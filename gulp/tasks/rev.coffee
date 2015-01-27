del = require 'del'
es = require 'event-stream'
paths = require 'vinyl-paths'

module.exports = (gulp, config, $) ->
  gulp.task 'rev', [ 'sass', 'uglify', 'image' ], (callback) ->
    [ img, src, map ] = [ paths(), paths(), paths() ]
    onlyMaps = $.filter([ '**/*.*', '!**/*.map' ])

    imgStream = gulp.src(config.path.dist + '/**/*.{jpg,png,svg}')
      .pipe(img)
      .pipe($.rev())

    srcStream = gulp.src(config.path.dist + '/**/*.{js,css}')
      .pipe($.sourcemaps.init loadMaps: true)
      .pipe(src)
      .pipe($.rev())
      .pipe($.sourcemaps.write '.')

    gulp.src(config.path.dist + '/**/*.map').pipe(map)

    es.merge(imgStream, srcStream)
      .pipe(gulp.dest config.path.dist)
      .pipe(onlyMaps)
      .pipe($.size showFiles: true, gzip: true)
      .pipe(onlyMaps.restore())
      .pipe($.rev.manifest())
      .pipe(gulp.dest config.path.dist)
      .on('end', -> del [].concat(img.paths, src.paths, map.paths), callback)

    return