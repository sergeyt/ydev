fs = require "fs"
path = require "path"
nopt = require "nopt"
_ = require "underscore"

# load command plugins
commands = fs.readdirSync(path.join(__dirname, 'commands'))
  .filter (file) ->
    name = path.basename(file, '.coffee')
    switch name
      when 'cli' then false
      else true
  .map (file) ->
    name = path.basename(file, '.coffee')
    cmd = {}
    cmd[name] = require "./commands/#{name}"
    cmd

commands = _.extend.apply _, commands

usage = () ->
  commands.help([], commands)

main = () ->

  # two first args are [nodejs, index.js]
  name = process.argv[2]
  unless name
    console.log("no command")
    usage()
    process.exit(-1)

  cmd = commands[name]
  unless _.isFunction(cmd)
    console.log("unknown command: #{name}")
    usage()
    process.exit(-1)

  args = process.argv.slice(3)
  # help command takes commands arg
  return cmd(args, commands) if name == "help"

  cmd(args)

main()
