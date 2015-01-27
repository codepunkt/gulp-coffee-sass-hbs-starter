del = require 'del'

module.exports = (gulp, config) ->
  gulp.task 'clean', (callback) ->
    del [ config.path.dist + '/**' ], callback
