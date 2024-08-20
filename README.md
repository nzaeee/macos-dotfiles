# My dotfiles

This directory contains my dotfiles for macOS.

## Requirements

- Homebrew
- Git

## Installation

1. Clone this repository

   ```sh
   $ git clone git@github.com:lclhugo/dotfiles.git
   ```

2. Install the brew bundle

   ```sh
   $ cd dotfiles
   $ brew bundle --file=.config/homebrew/Brewfile
   ```

3. Use stow to symlink the dotfiles
   ```sh
   cd dotfiles
   $ stow .
   ```
