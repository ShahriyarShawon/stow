vim.cmd([[
set number
let mapleader = ','
set pastetoggle=<F2>
set wildmenu
set ruler
set ignorecase
set hlsearch
set incsearch
set showmatch
syntax on
set expandtab
set smarttab
set shiftwidth=4
set smartindent
set softtabstop=4
set autoindent
set background=light
set cc=80
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
]])

vim.api.nvim_set_keymap(
    "n",
    "j",
    "jzz",
    {noremap = true}
)

vim.api.nvim_set_keymap(
    "n",
    "k",
    "kzz",
    {noremap = true}
)



require('packer').startup(function(use)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "lukas-reineke/indent-blankline.nvim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter'
    }

end)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

require('lualine').setup {
  options = {
    theme = 'gruvbox',
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
