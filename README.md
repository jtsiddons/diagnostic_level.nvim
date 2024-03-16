# diagnostic_level.nvim

Simple neovim plugin to set diagnostic level.

## Functions

The functions that take `level` as input can take an integer between 1 and 4 (where 1 is `ERROR`) or the full vim diagnostic setting level: `vim.diagnostic.severity.ERROR`.

### Virtual Text

`set_diag_level(level)` - Display only messages of this `level`  
`set_diag_min(level)` - Display only messages with severity >= this `level`

### Sign Column

`set_sign_level(level)` - Add signs for only this `level`  
`set_sign_min(level)` - Add signs for diagnostics >= this `level`

### Underline

`set_underline_level(level)` - Underline only for this `level`  
`set_underline_min(level)` - Underline for >= this `level`

## TODO

Add tests!
