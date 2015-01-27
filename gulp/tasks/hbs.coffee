fs = require('fs')
reload = require('browser-sync').reload

module.exports = (gulp, config, $) ->
  hbs = (maps) ->
    maps = JSON.parse try
      fs.readFileSync config.path.dist + '/rev-manifest.json', 'utf8'
    catch e
      '{}'

    getURL = (url) ->
      maps[url] || url

    gulp.src(config.path.src + '/*.hbs')
      .pipe($.compileHandlebars {}, helpers: url: getURL)
      .pipe($.rename extname: '.html')
      .pipe(gulp.dest config.path.dist)
      .pipe(reload stream: true)

  gulp.task 'hbs', [ if $.util.env.prod then 'rev' else 'clean' ], hbs
  gulp.task 'hbs:watch', hbs
