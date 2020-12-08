if has('win32')
    let g:python3_host_prog='C:\Users\icebear\miniconda3\envs\lit\python.exe'
    let g:python_host_prog='C:\Users\icebear\miniconda3\envs\lit\python.exe'
elseif has('mac')
    let g:python3_host_prog='/Users/icebear/miniconda3/bin/python'
    let g:python_host_prog='/Users/icebear/miniconda3/bin/python'
endif
""Essentials
set hidden
"lowercase for insensitive search, but upper for sensitive 
set ignorecase
set smartcase

""Sessions
"""check out https://dockyard.com/blog/2018/06/01/simple-vim-session-management-part-1
let g:session_dir = 'C:\Users\icebear\miniconda3\envs\Repos\sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'


"Normal mappings
"Start commands with ; rather than :
"nnoremap ; : "Remember, ;. repeats last motion
" make Y consistent with C and D.
nnoremap Y y$
"Terminal mappings
"Use Esc to go back to normal mode
tnoremap <esc> <c-\><c-n>
"Insert line below by Enter
nmap <CR> o<Esc>
"Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
call NumberToggle()
set number
"Basics
set cursorline "Highlight current line
set showmatch "Show matching braces
set statusline+=%F "display filepath in status bar
"More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
"Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Split resize  via arrow keys
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>wv <C-w>t<C-w>H
map <Leader>wh <C-w>t<C-w>K
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" Use Shift+Arrow to scroll
map <S-Down> <C-E>
map <S-Up> <C-Y>


"Code Basics
command! MakeTags !ctags -R

"Display vertical column
set cc=100
"Spellchecking
"set spelllang=en_uk
"set spell

""Vim-Plug
"Set plugin directory for vim-plug:
"	Specify a directory for plugins
" 	- For Neovim: stdpath('data') . '/plugged'
" 	- Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data').'/plugged')

""Haskell
"Plug 'parsonsmatt/intero-neovim'
"Plug 'neomake/neomake'

""Rust
Plug 'rust-lang/rust.vim'


""LaTeX Stuff
"Load the tex template if it's a new file
"""""""""|Don't need LaTeX for now
""""""""""autocmd BufNewFile *.tex 0read ~/.config/nvim/templates/skeleton.tex
"""""""""""Compilation
""""""""""Plug 'lervag/vimtex' , { 'for':'tex'}
""""""""""let g:tex_flavor='latex'
""""""""""if has('mac')
""""""""""let g:vimtex_view_method='skim'
""""""""""elseif has('unix')
""""""""""let g:vimtex_view_method='zathura'
""""""""""endif
""""""""""let g:vimtex_quickfix_mode=0
""""""""""let g:vimtex_compiler_progname='nvr'
""""""""""let g:vimtex_fold_enabled = 1 "Folding
"""""""""""Live Preview
""""""""""Plug 'xuhdev/vim-latex-live-preview' , { 'for': 'tex' }
""""""""""autocmd Filetype tex setl updatetime=1000 " setting update interval
""""""""""if has('mac')
""""""""""let g:livepreview_previewer = 'open -a Skim' "use Skim
""""""""""elseif has('unix')
""""""""""let g:livepreview_previewer = 'zathura' "use Skim
""""""""""endif
"""""""""""autocmd BufReadPost,BufNewFile *.tex :LLPStartPreview<CR>  "Autostart Live preview on first write to tex file
"""""""""""autocmd BufEnter,BufNewFile *.tex :VimtexCompile<CR> "Autostart Live preview on first write to tex file
"""""""""""Better concealment
""""""""""Plug 'PietroPate/tex-conceal.vim', { 'for':'tex'}
""""""""""set conceallevel=2
""""""""""let g:tex_conceal='abdgms'
""""""""""
""""""""""autocmd BufWritePre *.tex %s/\s\+$//e "automatically remove white spaces on save (only on .tex files)

""Snippets
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwadTrigger = '<tab>'
let g:UltiSnipsEditSplit="vertical"

""Theming
Plug 'joshdick/onedark.vim' "OneDark Theme

""Startup screen
Plug 'mhinz/vim-startify'
let g:startify_session_dir = 'C:\Users\icebear\miniconda3\envs\Repos\sessions'

""Airline
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme =   'onedark'
if has('win32')
let g:airline_theme =   'minimalist'
endif
let g:airline_section_warning = ''

""Registers
"can't work without this one
Plug 'junegunn/vim-peekaboo'
"let g:peekaboo_compact = 1
let g:peekaboo_window = 'bo 30new'

"Supertab
Plug 'ervandew/supertab'

"Command-T

"Python
"""check out https://www.vimfromscratch.com/articles/vim-for-python/
Plug 'numirias/semshi'
let g:semshi#error_sign_delay=5
Plug 'jiangmiao/auto-pairs'
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4


"Need folding, let's have it indent based
"au BufNewFile,BufRead *.py set foldmethod=indent
"Lets Try plugins
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

"Execute current script without saving
autocmd FileType python map <buffer> <F10> :w !C:\Users\icebear\miniconda3\envs\lit\python.exe<CR>
autocmd FileType python imap <buffer> <F10> <esc> :w !C:\Users\icebear\miniconda3\envs\lit\python.exe<CR>

"SLIME
Plug 'jpalardy/vim-slime'
let g:slime_target="neovim"

"Julia
Plug 'JuliaEditorSupport/julia-vim'  " , { 'for':'jl'} Don't do ,{for,'jl'} docs explicitly recommend against it
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

Plug 'Shougo/echodoc.vim'
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

"Linting
Plug 'dense-analysis/ale'
"Analysis
let g:ale_linters = {'python': ['flake8', 'pylint'],
      \   'julia': ['LanguageServer'],}
"      \   'javascript': ['eslint'],
"      \}
"Fixing
let g:ale_fixers = { 'python': ['yapf'],}
nmap <F9> :ALEFix<CR>
let g:ale_fix_on_save = 1
"Show total in statusline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
	\   '❌: %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

""Completion via deoplete
Plug 'shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1 "1 "Use Deoplete
"Use deoplete with vimtex
"call deoplete#custom#var ('omni', 'input_patterns', { 'tex': g:vimtex#re#deoplete, 'r': '[^. *\t]\.\w*', }) 
"Great overall plugin, gives you signatures while typing, jump to definitions etc
Plug 'davidhalter/jedi-vim'
let g:jedi#use_splits_not_buffers = "left"
"But deoplete for completion because asynchronous
Plug 'deoplete-plugins/deoplete-jedi'
let g:jedi#completions_enabled = 0 
"Integrate with ALE??
"call deoplete#custom#option('sources', {'_': ['ale',],}) "'deoplete-jedi'],})

""Git integration
"Plug 'tpope/vim-fugitive'

"autosave??
"set autowrite

"Folding
"Plug 'matze/vim-tex-fold'
"Plug 'konfekt/fastfold'
"set foldmethod=syntax
"let g:tex_fold_enabled =1
" Space will toggle folds!
 nnoremap <space> za



" Initialize plugin system
call plug#end()

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

" julia
let g:default_julia_version = '1.5.2'

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark "Change theme
syntax on "Turn on syntax highlighting
filetype plugin indent on




"Auto closing brackets
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap (<CR> (<CR>)<Esc>ko<tab>

autocmd User Startified setlocal cursorline
