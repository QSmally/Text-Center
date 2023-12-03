
# Text Center

Text centering plugin for Vim

It's originally based on [this StackOverflow post](https://stackoverflow.com/questions/26137838/vim-centering-text-within-selection),
so thank you, Kent. I made this a plugin so I can remove the function defintions
out of my `.vimrc` whilst not having to install a plugin that does fancy block
drawing. [It's awesome](https://github.com/sk1418/blockit) if you need it.

## Installation

```vim
Plug 'QSmally/Text-Center'
```

There's no visual key map besides the `:CenterText` command, but you can add it
yourself:

```vim
" lower 'c' is taken by the 'change' motion
" upper 'C' is the same as visual-line mode and lower 'c'
vnoremap C :CenterText<CR>
```

## Usage

Cursor placed somewhere between the `|` characters, typing `vi|:CenterText` or
`vi|C` with the key map:

```
*----------------*      *----------------*
| foo            | ---> |      foo       |
*----------------*      *----------------*
```
