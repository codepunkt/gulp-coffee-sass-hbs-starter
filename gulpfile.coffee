glob = require 'glob'
gulp = require 'gulp'
$ = do require 'gulp-load-plugins'
config = require './gulp/config'

glob.sync('./gulp/tasks/**/*.coffee').forEach (fileName) ->
	require(fileName) gulp, config, $
