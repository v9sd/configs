"MIT License

"Copyright (c) 2023 v9sd

"Permission is hereby granted, free of charge, to any person obtaining a copy
"of this software and associated documentation files (the \"Software\"), to deal
"in the Software without restriction, including without limitation the rights
"to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"copies of the Software, and to permit persons to whom the Software is
"furnished to do so, subject to the following conditions:

"The above copyright notice and this permission notice shall be included in all
"copies or substantial portions of the Software.

"THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
"SOFTWARE.

set encoding=utf-8

set nocompatible
filetype off

call plug#begin('~/.nvim/plugins')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " https://github.com/preservim/nerdtree
  Plug 'https://github.com/preservim/nerdtree'

  " https://github.com/ryanoasis/vim-devicons"
  Plug 'https://github.com/ryanoasis/vim-devicons'

  " https://github.com/vim-airline/vim-airline
  Plug 'vim-airline/vim-airline'

  " https://github.com/vim-airline/vim-airline-themes#vim-airline-themes--
  Plug 'vim-airline/vim-airline-themes'

  "https://github.com/cdelledonne/vim-cmake"
  " Plug 'cdelledonne/vim-cmake'

  "https://github.com/thinca/vim-localrc"
  " Plug 'thinca/vim-localrc'

  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " https://github.com/akinsho/toggleterm.nvim
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

  " https://github.com/nvzone/volt
  " Beautifully crafted color tools for Neovim
  Plug 'nvzone/volt'

  " https://github.com/nvzone/menu
  " Menu for several operations
  Plug 'nvzone/menu'

  " https://github.com/nvim-lua/plenary.nvim"
  Plug 'nvim-lua/plenary.nvim'

  " 'stevearc/overseer.nvim'
  Plug 'stevearc/overseer.nvim'

  " https://github.com/Civitasv/cmake-tools.nvim"
  Plug 'Civitasv/cmake-tools.nvim'

  " https://github.com/rebelot/kanagawa.nvim"
  Plug 'rebelot/kanagawa.nvim'

  " For luasnip users.
  " Plug 'L3MON4D3/LuaSnip'
  " Plug 'saadparwaiz1/cmp_luasnip'

  " For ultisnips users.
  " Plug 'SirVer/ultisnips'
  " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  " For snippy users.
  " Plug 'dcampos/nvim-snippy'
  " Plug 'dcampos/cmp-snippy'

  " https://github.com/iamcco/markdown-preview.nvim "
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()

filetype plugin indent on

set number
set listchars=tab:··
set list

augroup filetypedetect
  au BufRead,BufNewFile *.octave set filetype=octave
augroup END

syntax on

"termdebug
  packadd termdebug
  hi debugPC term=reverse ctermbg=darkblue guibg=darkblue
  hi debugBreakpoint term=reverse ctermbg=red guibg=red

" plugin NERDTree
  nnoremap <leader>n :NERDTreeFocus<CR>
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>
  " Open the existing NERDTree on each new tab.
  autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" plugin vim-airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'

"tabs
  set expandtab
  set smartindent
  set tabstop=2
  set shiftwidth=2

" cmake
 "let build_dir_name = fnamemodify(getcwd(), ':t') 
 "let g:cmake_build_dir_location = '../'.build_dir_name.'-build'
 "let g:cmake_generate_options = ['-DCMAKE_EXPORT_COMPILE_COMMANDS:Bool=ON']
 "let g:cmake_root_markers = ["CMakeLists.txt"]
 "let g:cmake_default_config = "Debug"

"theme
  set cursorline
  hi CursorLine term=bold cterm=bold guibg=Black

"local wimrc
  "call localrc#load('.local.vimrc', getcwd())

"MarkdownPreview 
  " set to 1, nvim will open the preview window after entering the Markdown buffer
  " default: 0
  let g:mkdp_auto_start = 0

  " set to 1, the nvim will auto close current preview window when changing
  " from Markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1

  " set to 1, Vim will refresh Markdown when saving the buffer or
  " when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 0

  " set to 1, the MarkdownPreview command can be used for all files,
  " by default it can be use in Markdown files only
  " default: 0
  let g:mkdp_command_for_global = 0

  " set to 1, the preview server is available to others in your network.
  " By default, the server listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0

  " use custom IP to open preview page.
  " Useful when you work in remote Vim and preview on local browser.
  " For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''

  " specify browser to open preview page
  " for path with space
  " valid: `/path/with\ space/xxx`
  " invalid: `/path/with\\ space/xxx`
  " default: ''
  let g:mkdp_browser = ''

  " set to 1, echo preview page URL in command line when opening preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0

  " a custom Vim function name to open preview page
  " this function will receive URL as param
  " default is empty
  let g:mkdp_browserfunc = ''

  " options for Markdown rendering
  " mkit: markdown-it options for rendering
  " katex: KaTeX options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: whether to disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: means the cursor position is always at the middle of the preview page
  "   top: means the Vim top viewport always shows up at the top of the preview page
  "   relative: means the cursor position is always at relative positon of the preview page
  " hide_yaml_meta: whether to hide YAML metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  " content_editable: if enable content editable for preview page, default: v:false
  " disable_filename: if disable filename header for preview page, default: 0
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0,
      \ 'toc': {}
      \ }

  " use a custom Markdown style. Must be an absolute path
  " like '/Users/username/markdown.css' or expand('~/markdown.css')
  let g:mkdp_markdown_css = ''

  " use a custom highlight style. Must be an absolute path
  " like '/Users/username/highlight.css' or expand('~/highlight.css')
  let g:mkdp_highlight_css = ''

  " use a custom port to start server or empty for random
  let g:mkdp_port = ''

  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'

  " use a custom location for images
  let g:mkdp_images_path=$HOME . '/.markdown_images'
  call mkdir(g:mkdp_images_path, "p", 0700)

  " recognized filetypes
  " these filetypes will have MarkdownPreview... commands
  let g:mkdp_filetypes = ['markdown']

  " set default theme (dark or light)
  " By default the theme is defined according to the preferences of the system
  let g:mkdp_theme = 'dark'

  " combine preview window
  " default: 0
  " if enable it will reuse previous opened preview window when you preview markdown file.
  " ensure to set let g:mkdp_auto_close = 0 if you have enable this option
  let g:mkdp_combine_preview = 0

  " auto refetch combine preview contents when change markdown buffer
  " only when g:mkdp_combine_preview is 1
  let g:mkdp_combine_preview_auto_refresh = 1

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up toggleterm
  require("toggleterm").setup{}

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  vim.lsp.set_log_level("debug")

  -- Custom on_attach function
  local lsp_server_on_attach = function(client, bufnr)
    -- Your custom keymaps and LSP handlers
  end

  local project_build_dir=vim.uv.cwd()
  local project_build_dir_debug=project_build_dir .. "-build-debug"
  local project_build_dir_release=project_build_dir .. "-build-release"
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig').clangd.setup {
    capabilities = capabilities,
    on_attach = lsp_server_on_attach,
    cmd = {
      "clangd",
      "--background-index",
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--cross-file-rename",
      "--header-insertion=never"
    },
    init_options = {
      compilationDatabasePath = project_build_dir .. "-build",
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
  }

  -- Keyboard users
  -- vim.keymap.set("n", "<C-t>", function()
  vim.keymap.set("n", "ym", function()
    require("menu").open("default")
  end, {})

  -- mouse users + nvimtree users!
  vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
    require('menu.utils').delete_old_menus()

    vim.cmd.exec '"normal! \\<RightMouse>"'

    -- clicked buf
    local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
    local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

    require("menu").open(options, { mouse = true })
  end, {})

  local osys = require("cmake-tools.osys")
  require("cmake-tools").setup {
    cmake_command = "cmake", -- this is used to specify cmake command path
    ctest_command = "ctest", -- this is used to specify ctest command path
    cmake_use_preset = true,
    cmake_regenerate_on_save = false, -- auto generate when save CMakeLists.txt
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
    cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
    -- support macro expansion:
    --       ${kit}
    --       ${kitGenerator}
    --       ${variant:xx}
    cmake_build_directory = function()
      -- if osys.iswin32 then
        -- return "out\\${variant:buildType}"
      -- end
      return vim.loop.cwd() .. "out/${variant:buildType}"
    end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
    cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
    cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
    cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
    cmake_variants_message = {
      short = { show = true }, -- whether to show short message
      long = { show = true, max_length = 40 }, -- whether to show long message
    },
    cmake_dap_configuration = { -- debug settings for cmake
      name = "cpp",
      type = "codelldb",
      request = "launch",
      stopOnEntry = false,
      runInTerminal = true,
      console = "integratedTerminal",
    },
    cmake_executor = { -- executor to use
      name = "quickfix", -- name of the executor
      opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
      default_opts = { -- a list of default and possible values for executors
        quickfix = {
          show = "always", -- "always", "only_on_error"
          position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
          size = 10,
          encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
          auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
        },
        toggleterm = {
          direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
          close_on_exit = false, -- whether close the terminal when exit
          auto_scroll = true, -- whether auto scroll to the bottom
          singleton = true, -- single instance, autocloses the opened one, if present
        },
        overseer = {
          new_task_opts = {
              strategy = {
                  "toggleterm",
                  direction = "horizontal",
                  autos_croll = true,
                  quit_on_exit = "success"
              }
          }, -- options to pass into the `overseer.new_task` command
          on_new_task = function(task)
              require("overseer").open(
                  { enter = false, direction = "right" }
              )
          end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
        },
        terminal = {
          name = "Main Terminal",
          prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
          split_direction = "horizontal", -- "horizontal", "vertical"
          split_size = 11,

          -- Window handling
          single_terminal_per_instance = true, -- Single viewport, multiple windows
          single_terminal_per_tab = true, -- Single viewport per tab
          keep_terminal_static_location = true, -- Static location of the viewport if avialable
          auto_resize = true, -- Resize the terminal if it already exists

          -- Running Tasks
          start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
          focus = false, -- Focus on terminal when cmake task is launched.
          do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
        }, -- terminal executor uses the values in cmake_terminal
      },
    },
    cmake_runner = { -- runner to use
      name = "terminal", -- name of the runner
      opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
      default_opts = { -- a list of default and possible values for runners
        quickfix = {
          show = "always", -- "always", "only_on_error"
          position = "belowright", -- "bottom", "top"
          size = 10,
          encoding = "utf-8",
          auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
        },
        toggleterm = {
          direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
          close_on_exit = false, -- whether close the terminal when exit
          auto_scroll = true, -- whether auto scroll to the bottom
          singleton = true, -- single instance, autocloses the opened one, if present
        },
        overseer = {
          new_task_opts = {
              strategy = {
                  "toggleterm",
                  direction = "horizontal",
                  autos_croll = true,
                  quit_on_exit = "success"
              }
          }, -- options to pass into the `overseer.new_task` command
          on_new_task = function(task)
          end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
        },
        terminal = {
          name = "Main Terminal",
          prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
          split_direction = "horizontal", -- "horizontal", "vertical"
          split_size = 11,

          -- Window handling
          single_terminal_per_instance = true, -- Single viewport, multiple windows
          single_terminal_per_tab = true, -- Single viewport per tab
          keep_terminal_static_location = true, -- Static location of the viewport if avialable
          auto_resize = true, -- Resize the terminal if it already exists

          -- Running Tasks
          start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
          focus = false, -- Focus on terminal when cmake task is launched.
          do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
        },
      },
    },
    cmake_notifications = {
      runner = { enabled = true },
      executor = { enabled = true },
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
      refresh_rate_ms = 100, -- how often to iterate icons
    },
    cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
  }
  -- kanagawa theme options:
  require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        -- dark = "wave",           -- try "dragon" !
        dark = "dragon",
        light = "lotus"
    },
  })

  -- setup must be called before loading
  vim.cmd("colorscheme kanagawa")

EOF
