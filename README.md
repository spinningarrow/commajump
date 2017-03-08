# commajump

Stupid simple autojump clone. Fish shell only (for now).

## Install

1. Put `,.fish` and `__commajump_add.fish` in the `functions` folder inside the
   fish config folder (i.e. `~/.config/fish/functions/`)
2. Add this to your `config.fish`

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
