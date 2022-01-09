vim.cmd([[
try
    colorscheme zenburn
    hi DiagnosticError guifg=#f44336
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]])
