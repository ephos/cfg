" https://dougblack.io/words/a-good-vimrc.html

" Plugins
call plug#begin('~/.vim/myplugins')
" Go Development Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Rainbow bracket colorizer for Vim
Plug 'frazrepo/vim-rainbow'
" Bracket pair creator
Plug 'jiangmiao/auto-pairs'
" Linter
Plug 'w0rp/ale'
" Bottom information bar
Plug 'itchyny/lightline.vim'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax Highlighting
Plug 'sheerun/vim-polyglot'
" Terraform Plugin
Plug 'hashivim/vim-terraform'
" Color Tag Colorizer
Plug 'lilydjwg/colorizer'
" Color theme
Plug 'dracula/vim', {'as':'dracula'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'
" NERD Commenter
Plug 'preservim/nerdcommenter'
" NERD Tree
Plug 'preservim/nerdtree'
" NERD Tree Icons
Plug 'ryanoasis/vim-devicons'
" NERD Tree Git Integration
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'iraphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" C# Omnisharp-Roslyn
Plug 'OmniSharp/omnisharp-vim'
" Pywal
Plug 'dylanaraps/wal.vim'

"" Prettier Config
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Keep Lightline Status on Modal Change
set laststatus=2

" Vim Markdown Config
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown setlocal ts=2 sw=2 expandtab
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_mark = 1
let g:vim_markdown_toml_formatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

call plug#end() 

" Colorscheme
set background=dark
"colorscheme ayu
colorscheme dracula
"colorscheme onedark
"colorscheme PaperColor
"colorscheme deus
let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ }
" Editor Settings
syntax on
set lazyredraw " improve performance
set noswapfile " disable the swapfile
" Line Settings
set relativenumber " show line numbers relative to current cursor
set number " show line numbers
set cursorline " highlight line on the current cursor 
" Command Settings
set showmode
set showcmd " show partial commands in the last line
set ruler " show ruler, i.e. line/column
set cmdheight=1 " command line one line high
" Menu Settings
set wildmenu " expand commands in the command menu as you type them 
set wildmode=longest:full
" Search Settings
set incsearch " incremental search 
set hlsearch " highlight all results
set showmatch " highlight matching brace pairs
set ignorecase " ignore case in search
" Folding Settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za
" Tab and Space Settings
set cindent
set autoindent smartindent "auto/smart indent
set smarttab " tab and backspace are smart
set tabstop=4 " 6 spaces
set shiftwidth=4 " size of indent
set softtabstop=4 "spaces and tabs used to simulate tab stops at a width
set smarttab " tab and backspace are smart
set expandtab " expand Tabs to spaces
" History Settings
set scrolloff=5 " keep at least 5 lines above/below
set sidescrolloff=5 " keep at least 5 lines left/right
set history=200
set undolevels=1000 " 1000 undos
set updatecount=100 " switch every 100 chars

" Keybinds
nnoremap <C-t> :NERDTreeToggle<CR>

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_imports_mode = 1
let g:go_imports_autosave = 1
let g:go_doc_popup_window = 1
" Enable lsp for go by using gopls
"let g:completor_filetype_map = {}
"let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

"Vim Rainbow
let g:rainbow_active = 1

" Smart Paste Toggles
" Set term paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Set tmux paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
