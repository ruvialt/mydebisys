set termguicolors
set background=dark

silent! colorscheme codedark

highlight clear Normal
highlight clear CursorLine
highlight clear CursorLineNr
highlight clear LineNr
highlight clear CursorColumn
highlight clear SignColumn
highlight clear ColorColumn
highlight clear StatusLine
highlight clear StatusLineNC
highlight clear EndOfBuffer
highlight clear ModeMsg
highlight clear ErrorMsg
highlight clear Question

highlight Normal guibg=#000000 guifg=#f0f0f0
highlight CursorLine guibg=#0f0f0f
highlight LineNr guibg=#0a0a0a guifg=#323232
highlight SignColumn guibg=#191919
highlight ColorColumn guibg=#0a0a0a
highlight StatusLine guibg=#000064
highlight StatusLineNC guibg=#000032
highlight EndOfBuffer guifg=#000000
highlight ErrorMsg guibg=#000000 guifg=#bc3f3c

highlight link CursorLineNr CursorLine
highlight link CursorColumn CursorLine
highlight link ModeMsg Normal
highlight link Question Normal

syntax on
