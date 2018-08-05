# Dotfiles

My small but growing collection of dotfiles.

## Installation

Ideally, clone this repository to `/opt/dotfiles`. It will create
symbolic links from this repo to the user-level configurations.
That way, changes made in the repo can be propagated to my different
machines using this setup.

Run `./install.sh`. It will install the following system-level
dependencies:

- Nix
  - Tmux, tmuxinator, yarn
- Zsh
  - Pure prompt
  - Auto completions and suggestions

As well as configuring the path for go development.

## Configuring iTerm2

Open the `Preferences` and tell it to log in with zsh.

Preferences > Profiles > General > Command > `zsh --login`
