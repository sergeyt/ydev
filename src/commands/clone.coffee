# clone command
git = require("git.js")({verbose: true})
hg = require("hg.js")({verbose: true})
_ = require("underscore")
_.str = require("underscore.string")

# TODO ask for credentials
clone = (args) ->
  repo = args[0]
  if _.str.startsWith(repo, "bb:")
    repo = repo.substr(3)
    hg.config().then (config) ->
      user = config["auth.bitbucket.org.username"]
      url = "https://bitbucket.org/#{user}/#{repo}"
      hg.clone url
  else
    # TODO check bitbucket repo
    git.config.global.user.name.then (user) ->
      url = "https://github.com/#{user}/#{repo}"
      git.clone url

clone.description = "clone github|bitbucket|etc repository"

module.exports = clone
