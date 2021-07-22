execute pathogen#infect()
autocmd FileType make setlocal noexpandtab " Make file will be forced to have tabs
                                           " ^^ Doesn't make sense because vim
                                           " understands makefiles... Not broke,
                                           " don't fix...
" If you don't have nodejs and yarn use pre build, add 'vim-plug' to the filetype list so vim-plug can update
" this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

filetype plugin indent on
" Powerline stuff
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" Always show statusline
set laststatus=2
let g:Powerline_symbols = 'unicode'
let g:Powerline_theme = 'default'
let g:Powerline_stl_path_style = 'short'
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_colorscheme = 'solarized256'

set noswapfile

" turn off preview
set completeopt-=preview

" Zenburn colorsheme
syntax enable
set background=dark
set t_Co=256
colorscheme zenburn

set nowrap " Do not wrap text
set expandtab " Insert spaces instead of tabs
set tabstop=4 " Set the number of spaces to 4
set autoindent "always set autoindenting on
set shiftwidth=4 " number of spaces to use for auto indenting
set showmatch " show mathchning parens
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set cursorline " highlights current line
set cursorcolumn " highlights current column
set number " always show the line nubmers
set relativenumber " relative line numbering.
set textwidth=80 " Fix the column width to 80 characters
let NERDTreeShowHidden=1 " Show hidden files in NERDTree

" Go specific settings
" Auto formatting and importing
filetype plugin indent on
set autowrite
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
au filetype go inoremap <buffer> . .<C-x><C-o>
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
nnoremap <F2> :NERDTreeToggle<CR> " Map F2 to toggle NERDTree
nnoremap <C-Left> :tabprevious<CR> " Ctrl + left arrow moves to left tab
nnoremap <C-Right> :tabnext<CR> " Ctrl + right arrow moves to right tab
nnoremap <C-n> :call NumberToggle()<cr> " Ctrl + n calls NumberToggle() to toggle relative lines
" Window resizing mappings /*{{{*/
nnoremap <S-k> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <S-j> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <S-h> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <S-l> :normal <c-r>=Resize('>')<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Function: NumberToggle
" Function to toggle relative line numbering.
" function stolen from:
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" Slightly modified because their example didn't do what I wanted.
" On my laptop it moves my cursor by one... Not sure why. At work it doesn't do
" this.
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Function: Resize(dir)
" Resizes a window in a direction. Stolen from
" http://vim.wikia.com/wiki/Fast_window_resizing_with_plus/minus_keys
" Has a peculiar behavior of resizing one more click in the direction you were
" resizing prior to switch directions. This bug is on my ever so awesome POS
" laptop.
function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    execute "normal \<c-w>k"
    let up = winnr()
    if up != this
      execute "normal \<c-w>j"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    execute "normal \<c-w>h"
    let left = winnr()
    if left != this
      execute "normal \<c-w>l"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction
"/*}}}*/
