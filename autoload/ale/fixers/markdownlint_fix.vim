scriptencoding utf-8
" Author: Craig Gross <craig@c-gross.net>
" Description: Fix markdown files with markdownlint-cli2.

call ale#Set('markdown_markdownlint_fix_executable', 'markdownlint-cli2-fix')
call ale#Set('markdown_markdownlint_fix_options', '')

function! ale#fixers#markdownlint_fix#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'markdown_markdownlint_fix_executable')
    let l:options = ale#Var(a:buffer, 'markdown_markdownlint_fix_options')

    return {
    \   'command': ale#Escape(l:executable)
    \       . (!empty(l:options) ? ' ' . l:options : '') . ' %t',
	\	'read_temporary_file': 1,
    \}
endfunction
