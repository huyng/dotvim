" File: after/plugin/ctrlp.vim

" remap some keys
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
    \ 'ToggleType(-1)':       ['<s-tab>'],
    \ 'ToggleType(1)':        ['<tab>'],
    \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-f>', '<right>'],
    \ }

