path = require 'path'
notifier = require 'node-notifier'

module.exports = (file) ->
  return unless file.coffeelint.results.length
  first = file.coffeelint.results[0]

  notifier.notify
    title: "#{path.relative(process.cwd(), file.path)}:#{first.lineNumber}"
    message: if first.context
      "#{first.message} (#{first.context})"
    else
      first.message
