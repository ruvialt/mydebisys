let g:ale_virtualtext_cursor = 'disable'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_sign_error = '─'
let g:ale_sign_style_error = '─'
let g:ale_sign_warning = '─'
let g:ale_sign_style_warning = '─'

highlight clear ALEError
highlight clear ALEStyleError
highlight clear ALEWarning
highlight clear ALEStyleWarning
highlight ALEErrorSign guibg=#191919 gui=bold guifg=#9E2927
highlight ALEStyleErrorSign guibg=#191919 gui=bold guifg=#F49810
highlight ALEWarningSign guibg=#191919 gui=bold guifg=#BE9117
highlight ALEStyleWarningSign guibg=#191919 gui=bold guifg=#AEAE80

let g:ale_linters = {
\ 'sh': ['shellcheck'],
\ 'python': ['flake8'],
\ 'ps1': ['psscriptanalyzer'],
\}
