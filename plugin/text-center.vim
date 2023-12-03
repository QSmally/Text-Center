
"==============================================================================
"    Copyright: Copyright (C) 2023 Joey Smalen and other Contributors
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               dwm.vim is provided *as is* and comes with no warranty of
"               any kind, either expressed or implied. In no event will the
"               copyright holder be liable for any damages resulting from
"               the use of this software.
" Name Of File: text-center.vim
"  Description: A simple plugin to center text in a visual selection
"   Maintainer: Joey Smalen (QSmally, Smally) <github@qbot.eu>
" Last Changed: Sunday, 03 December 2023
"      Version: 0.0.1
"        Usage: This file should reside in the plugin directory and be
"               automatically sourced. For more help, see supplied
"               documentation.
"      History: See supplied documentation.
"==============================================================================

function! VisualSelection()
    try
        let v_save = @v
        normal! gv"vy
        return @v
    finally
        let @v = v_save
    endtry
endfunction

function! CenterText()
    let v = VisualSelection()
    let lre = '^\zs\s*\ze\S'
    let rre = '\s*$'
    let sp = matchstr(v, lre)
    let sp .= matchstr(v, rre)
    let ln = len(sp)

    let v = substitute(v, lre, sp[:ln/2-1], '')
    let v = substitute(v, rre, sp[ln/2:], '')
    let ve_save = &virtualedit
    let v_save = @v

    let &virtualedit = 'all'
    call setreg('v', v, visualmode())

    normal! gvx"vP
    let @v = v_save
    let &virtualedit = ve_save
endf

command! -range CenterText :call CenterText()<CR>
