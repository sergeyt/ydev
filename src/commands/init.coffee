userhome = require 'userhome'
toml = require 'tomljs'
fs = require 'fs'
git = require 'git.js'
hg = require 'hg.js'
npm = require 'npm'

# init command
init = (args) ->
  config_path = userhome('.ydevrc')
  unless fs.existsSync config_path
    console.log "no .ydevrc file at your home directory"
    process.exit(-1)

  console.log "loading #{config_path}"

  config = toml config_path
  console.log JSON.stringify(config, null, 2)

  # install tools/packages
  tools = config.tools || {}
  (tools.npm || []).forEach (name) ->
    console.log "installing #{name}"

  # clone repos

init.description = "init your development environment from config file"

module.exports = init
