" Plugins
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'NLKNguyen/papercolor-theme' 
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'neomake/neomake'
    Plug 'wellle/tmux-complete.vim'
    Plug 'preservim/vimux'
    Plug 'benmills/vimux-golang'
    Plug 'ivanov/vim-ipython'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set clipboard+=unnamedplus

" no swap file
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

"set line number
set number

" use 4 spaces instead of tab ()
"  copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hidden

" Config for chrisbra/csv.vim
augroup filetype csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" papercolor theme
set background=light
color PaperColor

" papercolor overrides
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'linenumber_bg' : ['#eeeeee', '7']
  \       }
  \     }
  \   }
  \ }

syntax on

" TextEdit might fail if hidden is not set.
set hidden

" set lightline theme
let g:lightline = { 'colorscheme': 'PaperColor' }

" coc.nvim config
set encoding=utf-8
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c


"coc.nvim use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" coc highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" coc formatting selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " set up formatexpr specified filetypes
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc applying codeAction to the selected region
xmap <leader>a <Plug>(coc-codeAction-selected)
nmap <leader>a <Plug>(coc-codeAction-selected)

" coc remap keys for applying codeAction to current buffer
nmap <leader>ac <Plug>(coc-codeAction)
nmap <leader>qf <Plug>(coc-fix-current)

" coc map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" coc preview buffer
set completeopt-=preview

" coc add :Format command to current buffer
command! -nargs=0 Format :call CocAction('format')

" coc add :Fold command to current buffer
command! -nargs=? Fold :call CocAction('fold',<f-args>)

" coc add :OR command 
command! -nargs=0 OR :call CocAction('runCommand','editor.action.organizeImport')

" coc add nvim statusline support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" mappings for CoCList
" show all diagnostics
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" manage extensions
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" show commands
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" find symbol of current doc
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" search workspace symbols
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" do default action for next item
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" do default action for previous item
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" resume latest coc list
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>












