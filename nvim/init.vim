""Essentials
"Normal mappings
"Start commands with ; rather than :
nnoremap ; :
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
autocmd BufNewFile *.tex 0read ~/.config/nvim/templates/skeleton.tex
"Compilation
Plug 'lervag/vimtex' , { 'for':'tex'}
let g:tex_flavor='latex'
if has('mac')
let g:vimtex_view_method='skim'
elseif has('unix')
let g:vimtex_view_method='zathura'
endif
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname='nvr'
let g:vimtex_fold_enabled = 1 "Folding
"Live Preview
Plug 'xuhdev/vim-latex-live-preview' ", { 'for': 'tex' }
autocmd Filetype tex setl updatetime=1000 " setting update interval
if has('mac')
let g:livepreview_previewer = 'open -a Skim' "use Skim
elseif has('unix')
let g:livepreview_previewer = 'zathura' "use Skim
endif
"autocmd BufReadPost,BufNewFile *.tex :LLPStartPreview<CR>  "Autostart Live preview on first write to tex file
"autocmd BufEnter,BufNewFile *.tex :VimtexCompile<CR> "Autostart Live preview on first write to tex file
"Better concealment
Plug 'PietroPate/tex-conceal.vim', { 'for':'tex'}
set conceallevel=2
let g:tex_conceal='abdgms'

autocmd BufWritePre *.tex %s/\s\+$//e "automatically remove white spaces on save (only on .tex files)

""Snippets
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwadTrigger = '<tab>'
let g:UltiSnipsEditSplit="vertical"

"Completion via deoplete
Plug 'shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1 "Use Deoplete

"Theming
Plug 'joshdick/onedark.vim' "OneDark Theme

""Startup screen
Plug 'mhinz/vim-startify'

"Airline
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
let g:airline_section_warning = ''

"Better Registers
Plug 'junegunn/vim-peekaboo'
"let g:peekaboo_compact = 1
let g:peekaboo_window = 'bo 30new'

"Git integration
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
call deoplete#custom#var ('omni', 'input_patterns', { 'tex': g:vimtex#re#deoplete, 'r': '[^. *\t]\.\w*', }) "Use deoplete with vimtex

"Auto closing brackets
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap (<CR> (<CR>)<Esc>ko<tab>
