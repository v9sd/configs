set encoding=utf-8

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " https://github.com/preservim/nerdtree
  Plugin 'preservim/nerdtree'
  " https://github.com/vim-airline/vim-airline
  Plugin 'vim-airline/vim-airline'
  " https://github.com/vim-airline/vim-airline-themes#vim-airline-themes--
  Plugin 'vim-airline/vim-airline-themes'
  " https://github.com/Xuyuanp/nerdtree-git-plugin
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  " https://github.com/ycm-core/YouCompleteMe
  Plugin 'ycm-core/YouCompleteMe'
  "https://github.com/lervag/vimtex
  Plugin 'lervag/vimtex'
  "https://github.com/rdnetto/YCM-Generator"
  Plugin 'rdnetto/YCM-Generator'
  "https://github.com/cdelledonne/vim-cmake"
  Plugin 'cdelledonne/vim-cmake'
  "https://github.com/thinca/vim-localrc"
  Plugin 'thinca/vim-localrc'

call vundle#end()
filetype plugin indent on

set number
set listchars=tab:··
set list

augroup filetypedetect
  au BufRead,BufNewFile *.octave set filetype=octave
augroup END

syntax on

packadd termdebug

hi debugPC term=reverse ctermbg=darkblue guibg=darkblue
hi debugBreakpoint term=reverse ctermbg=red guibg=red

" plugin NERDTree
  nnoremap <leader>n :NERDTreeFocus<CR>
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>

  " Start NERDTree when Vim is started without file arguments.
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
  "
  " If another buffer tries to replace NERDTree, put it in the other window,
  " and bring back NERDTree.
  "autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        "\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
  " Open the existing NERDTree on each new tab.
  autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" plugin vim-airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'

" plugin vimtex
  let g:vimtex_view_method = 'zathura'
  let g:tex_flavor='latex'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'

"tabs
  set expandtab
  set smartindent
  set tabstop=2
  set shiftwidth=2

" ycm
  let g:ycm_clangd_args = ['-log=verbose', '-pretty']
  " Let clangd fully control code completion
  let g:ycm_clangd_uses_ycmd_caching = 0
  " " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
  let g:ycm_clangd_binary_path = exepath("clangd")

  let g:ycm_neovim_ns_id = -1
  let g:ycm_show_diagnostics_ui = 0
  let g:ycm_log_level = 'debug'
  let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf = 0
   
" cmake
  let build_dir_name = fnamemodify(getcwd(), ':t') 
  let g:cmake_build_dir_location = '../'.build_dir_name.'-build'
  let g:cmake_generate_options = ['-DCMAKE_EXPORT_COMPILE_COMMANDS=ON']
  let g:cmake_default_config = "Debug"

"local wimrc
  call localrc#load('.local.vimrc', getcwd())
