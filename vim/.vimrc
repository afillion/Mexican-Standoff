set rulerformat=%v
set ruler
syntax on
filetype on
autocmd FileType c setlocal ts=4 sts=4 sw=4 noet ai " c
inoremap {		{}<Left>
inoremap (		()<Left>
inoremap [		[]<Left>
inoremap "		""<Left>
inoremap '		''<Left>
highlight ExtraWhitespace ctermbg=red
autocmd Syntax * syn match ExtraWhiteSpace / \{2,\}/
autocmd Syntax * syn match ExtraWhiteSpace /\s\+$/
set backupdir=~/.vim/tmp,/tmp

let g:headerbool = 0

function s:header ()
	if g:headerbool == 1
		return
	endif
	let g:headerbool = 1
    let g:author    = "By: " . strpart($USER, 0, 9) . " <" . strpart($MAIL, 0, 25) . ">"
    let g:file      = strpart(fnamemodify(bufname('%'), ':t'), 0, 41)
    let g:created   = "Created: " . strftime("%Y/%m/%d %H:%M:%S") . " by " . strpart($USER, 0, 9)
    let g:updated   = "/*   Updated: " . strftime("%Y/%m/%d %H:%M:%S") . " by " . strpart($USER, 0, 9)
    call append (0, '/* ************************************************************************** */')
    call append (1, '/*                                                                            */')
    call append (2, '/*                                                        :::      ::::::::   */')
    call append (3, '/*                                                      :+:      :+:    :+:   */')
    call append (4, '/*                                                    +:+ +:+         +:+     */')
    call append (5, '/*                                                  +#+  +#+       +#+        */')
    call append (6, '/*                                                +#+#+#+#+#+   +#+           */')
    call append (7, '/*                                                     #+#    #+#             */')
    call append (8, '/*                                                    ###   ########.fr       */')
    call append (9, '/*                                                                            */')
    call append (10, '/* ************************************************************************** */')
endfunction

function s:update ()
    let g:updated	= "/*   Updated: " . strftime("%Y/%m/%d %H:%M:%S") . " by " . strpart($USER, 0, 9) . "         ###   ########.fr       */"
	let bufmodified = getbufvar(bufname('%'), "&mod")
	if bufmodified
		call setline(9, g:updated)
		normal!=ji/*   <esc>
	endif
endfunction

command Header call s:header ()
nnoremap <C-c-h> :Header<CR>4G5lR<c-r>=file<CR><esc>6G5lR<c-r>=author<CR><esc>8G5lR<c-r>=created<CR><esc>9GR<c-r>=updated<CR><esc>11Go<esc>j
autocmd BufWritePre *.c call s:update ()
