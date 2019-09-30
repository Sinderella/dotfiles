set nocompatible              " be iMproved, required

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

syntax enable
silent! colorscheme onedark
set background=dark
" let g:solarized_termtrans = 1
let g:is_posix = 1
set number
set numberwidth=4
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set inccommand=split
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running command
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set textwidth=80
set colorcolumn=+1
set list listchars=tab:»·,trail:·,nbsp:·
set nojoinspaces

let mapleader = " "

let g:deoplete#enable_at_startup = 0

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

hi IndentGuidesOdd  ctermbg=237
hi IndentGuidesEven ctermbg=darkgrey

" toggle relative line numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

nnoremap <F5> "=strftime("%d/%m/%y %H:%M:%S %Z")<CR>P
inoremap <F5> <C-R>=strftime("%d/%m/%y %H:%M:%S %Z")<CR>

" fzf
let g:fzf_buffers_jump = 1
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-b> :<C-u>Buffers<CR>

" start where you took off last time
augroup vimrcEx
  autocmd!

  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" disable auto comment on next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" terminal map
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=9
endif

let g:ale_linters = {
\  'python': ['pylint']
\ }

let g:ale_linters_explicit = 1
let g:ale_python_flake8_executable = 'python3'
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ale_python_mypy_options = '--python-version 3.6'
let b:ale_fixers = {'python': ['isort', 'yapf']}
let g:vista_default_executive = 'ctags'

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:airline_section_c = "%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__# %{NearestMethodOrFunction()}%"


" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" grepper
nnoremap <leader>g :Rg<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" " Copy to clipboard
vnoremap  y  "+y
nnoremap  y  "+y
inoremap  <C-V> <C-R>+

set fo-=t

let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-m>'
let g:vim_markdown_new_list_item_indent = 0

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

let g:ale_fix_on_save = 1

" redraw when focus
au FocusGained * :redraw!

let g:table_mode_corner='|'

set t_ut=
" if &term =~ '256color'
"   " Disable Background Color Erase (BCE) so that color schemes
"   " work properly when Vim is used inside tmux and GNU screen.
"   set t_ut=
" endif

" au FileType python setl sw=2 sts=2 et

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'" 

let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

" Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1

command! -nargs=0 Sw w !sudo tee % > /dev/null

set diffopt+=vertical

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

