nopt = require "nopt"
git = require("git.js")(process.cwd())

main = () ->
  switch process.argv[1]
    when "clone"
      clone()
    when "init"
      init()

clone = () ->
  # TODO support other hosts like bitbucket.org and VCS systems like mecrurial
  git.config.global.user.name.then (user) ->
    repo = process.argv[2]
    url = "https://github/#{user}/#{repo}"
    git.clone url

init = () ->
  # TODO read devrc and run commands

main()
