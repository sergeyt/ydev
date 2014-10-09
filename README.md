# ydev

Fast bootstraping of development evironment

# Targets
- [ ] download .ydev.yml from github repository (get username using git config)
- [ ] Clone active repos from github/bitbucket
- [ ] Install apm/npm/gpm/chocolatey packages
- [ ] Install golang tools
- [ ] Support gemsets for ruby developers
- [ ] Support python package managers
- [ ] Package sets
- [ ] Environment sets

# Commands

`ydev init` - installs tools from default .devrc file

`ydev init other` - installs tools from other.devrc file

# .ydev.yml

This file defines assets to be installed by ydev. Example:

```
# active repositories to clone
active-repos:
# next repos will be cloned into $GOPATH src folder
  $GOPATH: [
    gocheckers
    hypster
  ]
  # next repos will be cloned into $HOME/pets folder
  $HOME/pets: []

# tools to install
tools: git mercurial atom golang

# tools to install with brew
brew: gpm

# npm packages to install
npm: bower gulp karma

# apm packages to install
apm: [
  git-plus go-plus
  script linter
  language-go
]

# gpm packages to install
gpm: []

```
