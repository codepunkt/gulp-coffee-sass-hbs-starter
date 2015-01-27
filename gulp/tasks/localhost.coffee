browserSync = require 'browser-sync'

module.exports = (gulp, config, $) ->
  gulp.task 'localhost', [
    'hbs'
    'sass'
    'image'
    if $.util.env.prod then 'uglify' else 'browserify'
  ], ->
    browserSync config.localhost
