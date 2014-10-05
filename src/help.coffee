_ = require "lodash"

usage = (commands) ->
  console.log "usage: dev command [options]"
  console.log "commands:"

  cmds = _.pairs(commands).map (p) ->
    cmd = {}
    cmd.name = p[0]
    cmd.value = p[1]
    cmd

  list = _.sortBy(cmds, "name").map (cmd) ->
    "  #{cmd.name} - #{cmd.value.description}"

  list.forEach (s) -> console.log s

help = (args, commands) ->
  unless args.length
    usage(commands)
    return

  name = args[0]
  cmd = commands[name]

  unless cmd
    console.log ("unknown command: #{name}")
    usage(commands)
    return

  unless cmd.help
    console.log ("'#{name}' command has no help topic")
    usage(commands)
    return

  console.log cmd.help

help.description = "print this help"

module.exports = help
