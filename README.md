# My dotfiles

This repository contains all my dotfiles for macOS, including my Brewfile, my config for zsh, tmux, ghostty and more

## Requirements

- Homebrew
- Git

## Installation

1. Clone this repository

   ```sh
   $ git clone git@github.com:nzxcx/dotfiles.git
   ```

2. Install the brew bundle

   ```sh
   $ cd dotfiles
   $ brew bundle --file=.config/homebrew/Brewfile
   ```

3. Use stow to symlink the dotfiles
   ```sh
   $ cd dotfiles
   $ stow .
   ```
