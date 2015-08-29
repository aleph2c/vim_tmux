"============================================================================
"File:        ghdl.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Jan Wagner <jaydyou at janidom dot de>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_vhdl_ghdl_checker")
    finish
endif
let g:loaded_syntastic_vhdl_ghdl_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_vhdl_ghdl_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args_after': '-s' })

    let errorformat =  '%f:%l:%c: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'vhdl',
    \ 'name': 'ghdl'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
