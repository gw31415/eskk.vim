" vim:foldmethod=marker:fen:
scriptencoding utf-8

" NEW BSD LICENSE {{{
"   Copyright (c) 2009, tyru
"   All rights reserved.
"
"   Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
"
"       * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
"       * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
"       * Neither the name of the tyru nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" }}}

" Change Log: {{{
" }}}
" Document {{{
"
" Name: skk7
" Version: 0.0.0
" Author:  tyru <tyru.exe@gmail.com>
" Last Change: 2010-02-04.
"
" Description:
"   NO DESCRIPTION YET
"
" Usage: {{{
"   Commands: {{{
"   }}}
"   Mappings: {{{
"   }}}
"   Global Variables: {{{
"   }}}
" }}}
" }}}

" Load Once {{{
if exists('g:loaded_skk7') && g:loaded_skk7
    finish
endif
let g:loaded_skk7 = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

" Scope Variables {{{
let s:debug_errmsg = []
" }}}
" Global Variables {{{

" Debug
if !exists('g:skk7_debug')
    let g:skk7_debug = 0
endif
if !exists('g:skk7_debug_wait_ms')
    let g:skk7_debug_wait_ms = 500
endif

" Mappings
if !exists('skk7_no_default_mappings')
    let skk7_no_default_mappings = 0
endif

" Misc.
if !exists('skk7_initial_mode')
    let skk7_initial_mode = 'hira'
endif
if !exists('skk7_registered_modes')
    " TODO
    let skk7_registered_modes = [
    \   ['Q', 'hira']
    \]
    " let skk7_registered_modes = [
    " \   ['q', 'kata'],
    " \   ['l', 'ascii'],
    " \   ['L', 'zenei'],
    " \   ['/', 'abbrev'],
    " \]
    " let skk7_registered_modes = {
    " \   'hira': {},
    " \   'kata': {'map_to': 'q'},
    " \   'ascii': {'map_to': 'l'}
    " \   'zenei': {'map_to': 'L'}
    " \   'abbrev': {'map_to': '/'}
    " \}
endif
if !exists('skk7_mapped_chars')
    " TODO 記号
    let skk7_mapped_chars =
    \   'abcdefghijklmnopqrstuvwxyz'
    \  .'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
endif
if !exists("skk7_marker_white")
  let skk7_marker_white = '▽'
endif
if !exists("skk7_marker_black")
  let skk7_marker_black = '▼'
endif

" }}}

" Mappings {{{

" Map if not mapped.
func! s:map(from, to, modes)
    for m in split(a:modes, '\zs')
        if !hasmapto(a:to, m)
            execute
            \   m . 'map'
            \   a:from
            \   a:to
        endif
    endfor
endfunc

noremap! <expr> <Plug>(skk7-enable)     skk7#enable()
noremap! <expr> <Plug>(skk7-sticky-key) skk7#sticky_key()
noremap! <expr> <Plug>(skk7-escape-key) skk7#escape_key()

if !g:skk7_no_default_mappings
    call s:map('<C-j>', '<Plug>(skk7-enable)'    , 'ic')
    call s:map(';'    , '<Plug>(skk7-sticky-key)', 'l')
    call s:map('z'    , '<Plug>(skk7-escape-key)', 'l')
endif
" }}}

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
