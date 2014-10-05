# clone command
git = require("git.js")(process.cwd())

clone = (args) ->
  # TODO support other hosts like bitbucket.org and VCS systems like mecrurial
  git.config.global.user.name.then (user) ->
    repo = args[0]
    url = "https://github/#{user}/#{repo}"
    git.clone url

clone.description = "clone github|bitbucket|etc repository"

module.exports = clone
