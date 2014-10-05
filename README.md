# dev

Fast bootstraping of development evironment

# Targets
- [ ] download .devrc from github repository (get username using git config)
- [ ] Clone active repos from github/bitbucket
- [ ] Install apm/npm/gpm packages
- [ ] Install golang tools
- [ ] Support gemsets for ruby developers
- [ ] Support python package managers
- [ ] Package sets
- [ ] Dev env sets

# Commands

`dev init` - installs tools from default .devrc file

`dev init other` - installs tools from other.devrc file

# .devrc

Example .devrc:

```
[active-repos] # active repositories to clone
$GOPATH # next repos will be cloned into $GOPATH src folder
gocheckers
hypster
$HOME/pets # next repos will be cloned into $HOME/pets folder

# tools to install
[tools]
git
mercurial
atom
golang

# tools to install with brew
[brew]
gpm

# npm packages to install
[npm]
bower gulp
karma

# apm packages to install
[apm]
git-plus go-plus
script linter
language-go

# gpm packages to install
[gpm]

```
