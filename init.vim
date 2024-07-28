:set number
:set relativenumber
:set autoindent
:set tabstop=5
:set shiftwidth=5
:set smarttab
:set softtabstop=5
:set mouse=a
:set splitright
:set linespace=100
:set nowrap
	
"Remaping movement from hjkl to jkl;
nnoremap j h
nnoremap k jzz
nnoremap l kzz
nnoremap ; l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l

onoremap j h
onoremap k j
onoremap l k
onoremap ; l
 
" Move line up or down
nnoremap mk <cmd> move +1 <cr>
nnoremap ml <cmd> move -2 <cr>

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'andweeb/presence.nvim'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'morhetz/gruvbox'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tmsvg/pear-tree'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '1.1.5' }
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'tribela/vim-transparent'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'
Plug 'ThePrimeagen/harpoon'
call plug#end()



" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 2
  return !col || getline('.')[col - 2]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()



let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }


"hi Normal guibg=NONE ctermbg=NONE
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() :
	  \ CheckBackspace() ? "\<CR>" :
      \ coc#refresh()

" SAVE
noremap <C-s> :w <cr>


" JUMP AND CENTER 
nnoremap <C-K> <C-d>zz
nnoremap <C-L> <C-u>zz

" Clear search
nnoremap <leader>c <cmd>noh<cr>


nnoremap n nzzzv
nnoremap N Nzzzv

" GO BACK TO FILE TREE
nmap <leader>pv :Ex <CR>

nmap <leader>a <Plug>(coc-codeaction)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-cursor)


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" HARPOON
nnoremap h <cmd>lua require("harpoon.mark").add_file()<cr><cr>:redraw!<cr>
nnoremap <leader>h <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 <cmd>lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>6 <cmd>lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>7 <cmd>lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>8 <cmd>lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>9 <cmd>lua require("harpoon.ui").nav_file(9)<CR>

lua require("harpoon").setup({ tabline = true, tabline_prefix="   ", tabline_suffix="   " })

highlight! HarpoonInactive guibg=NONE guifg=NONE
highlight! HarpoonActive guibg=NONE guifg=NONE gui=bold
highlight! HarpoonNumberActive guibg=NONE guifg=NONE
highlight! HarpoonNumberInactive guibg=NONE guifg=NONE
highlight! TabLineFill guibg=NONE guifg=NONE


" TELESCOPE
" Basic Telescope mappings and setup
lua require("telescope").setup({ defaults = {mappings = {n = { ["l"] = "move_selection_previous", ["k"] = "move_selection_next"},}}});



" Using Lua functions
nnoremap <A-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <A-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" When I press enter in telescope i want to navigate to the file
" and close telescope

"set the colorscheme
colorscheme tokyonight


" set the airline theme
autocmd VimEnter * AirlineTheme zenburn

" Resume exploring

nnoremap <leader>e <cmd>Rex<cr>

" Tree sitter highlighting
lua require("nvim-treesitter").setup({highlight=true, indent=true})
:TSEnable highlight
:TSEnable indent


" INDENT LINES
lua require("ibl").setup()

" Copilot


" Rust hover intellicence


" Use K to show documentation in preview window
nnoremap <leader>d  :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)




