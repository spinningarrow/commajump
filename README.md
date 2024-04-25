# commajump ![Build status](https://travis-ci.org/spinningarrow/commajump.svg?branch=master)

Stupid simple superfast autojump clone. Fish shell only (for now).

## Superfast?

Mostly because it's zero-overhead (it's a shell function instead of a script with a runtime ).

## Install

1. Clone the repository
2. Run `./install`
3. Add this to your `config.fish`

		source ~/.config/fish/functions/__commajump_add.fish

## Usage

Navigate to a few directories and then use `, <search-string>` to jump to a
directory that has been previously navigated to.

## Features

1. Case sensitive
2. Non-fuzzy search
3. Favours search term in folder name over path name
4. Prunes dead directories from the data store if they are searched for but no
   longer exist
