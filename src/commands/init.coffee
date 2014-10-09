userhome = require 'userhome'
fs = require 'fs'
git = require 'git.js'
hg = require 'hg.js'
npm = require 'npm'
yaml = require 'js-yaml'
exec = require 'exequte'
iswin = require 'iswin'
_ = require("underscore")
_.str = require("underscore.string")

load_yaml_file = (path) ->
  s = fs.readFileSync path, 'utf8'
  yaml.safeLoad s

# init command
init = (args) ->
  config_path = userhome('.ydev.yml')
  unless fs.existsSync config_path
    console.log "no .ydev.yml file at your home directory"
    process.exit(-1)

  config = load_yaml_file config_path

  # install global npm packages
  npm_packages = config.npm || []
  if typeof npm_packages is "string"
    npm_packages = npm_packages.split(',')
      .map (s) -> _.str.trim(s)
      .filter _.identity

  npm_cmd = if iswin() then "npm.cmd" else "npm"
  exec npm_cmd, ["install", "-g", npm_packages...], {cwd: process.cwd(), verbose: true}

  # clone repos

init.description = "init your development environment from config file"

module.exports = init
