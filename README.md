# diagnostic_level.nvim

Simple neovim plugin to set diagnostic level.

## Functions

The functions that take `level` as input can take an integer between 1 and 4 (where 1 is `ERROR`) or the full vim diagnostic setting level: `vim.diagnostic.severity.ERROR`.

### Virtual Text

`set_diag_level(level)` - Display only messages of this `level`  
`set_diag_min(level)` - Display only messages with severity >= this `level`

#### Virtual Text Prefix

`set_diag_prefixes({e = , w = , i = , h = })` - Prefixes for the diagnostic messages:

* `e` : Error prefix. Default is `E: `
* `w` : Warning prefix. Default is `W: `
* `i` : Info prefix. Default is `I: `
* `h` : Error prefix. Default is `H: `

Note input is a table with keys, `e`, `w`, `i`, and `h`. Any can be included or omitted, defaults will be used when not set.

### Sign Column

`set_sign_level(level)` - Add signs for only this `level`  
`set_sign_min(level)` - Add signs for diagnostics >= this `level`

### Underline

`set_underline_level(level)` - Underline only for this `level`  
`set_underline_min(level)` - Underline for >= this `level`

## TODO

Add tests!
