require 'packer'.startup(function(use)
  -- packer itself
  use { 'wbthomason/packer.nvim' }

  -- colorscheme
  use { 'folke/tokyonight.nvim', config = function()
    require("tokyonight").setup({
      style = "moon",
      on_colors = function(colors)
        colors.comment = "pink"
      end
    })
    vim.cmd [[colorscheme tokyonight]]
  end }

  use { 'kylechui/nvim-surround', config = function()
    require("nvim-surround").setup()
  end }

  use { 'tpope/vim-commentary' }

  use { 'jiangmiao/auto-pairs' }

  use { 'thinca/vim-quickrun' }

  use { 'simeji/winresizer' }

  use { 'mbbill/undotree', config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })
  end }

  use { 'machakann/vim-highlightedyank', event = 'TextYankPost', config = function()
    vim.g.highlightedyank_highlight_duration = -1
  end }

  use { "lukas-reineke/indent-blankline.nvim", config = function()
    require("indent_blankline").setup {
      space_char_blankline = " ",
    }
  end }

  use { 'jose-elias-alvarez/buftabline.nvim',
    config = function() require("buftabline").setup {} end
  }

  use { 'mhinz/vim-sayonara',
    config = function()
      vim.keymap.set('n', '<leader>q', ':Sayonara<CR>', {})
    end
  }

  use { 'yuki-yano/fuzzy-motion.vim', config = function()
    vim.keymap.set('n', '<leader>s', ':FuzzyMotion<CR>', {})
  end }

  use { 'ntpeters/vim-better-whitespace' }

  use { 'phaazon/hop.nvim', config = function()
    vim.keymap.set('n', "<Leader>l", ':HopWord<CR>', {})
    vim.keymap.set('n', "<Leader>j", ':HopLine<CR>', {})
    require 'hop'.setup()
  end }

  use { 'mvllow/modes.nvim', config = function()
    vim.opt.cursorline = true
    require('modes').setup()
  end }

  use { 'j-hui/fidget.nvim', config = function()
    require('fidget').setup {}
  end }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
    require 'nvim-treesitter.configs'.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      }
    })
  end }

  use { 'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup({})
      require("scrollbar.handlers.search").setup()
    end
  }

  use { 'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end
  }

  use { 'kevinhwang91/nvim-hlslens',
    config = function()
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*',
        [[*<Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '#',
        [[#<Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'g*',
        [[g*<Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'g#',
        [[g#<Cmd>lua require('hlslens').start()<CR>]],
        kopts)
    end
  }

  use { 'vim-denops/denops.vim' }

  use { 'nvim-lua/plenary.nvim' }

  use { 'neovim/nvim-lspconfig' }

  use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }

  use { 'folke/lsp-colors.nvim' }

  use { "williamboman/mason.nvim", config = function() require('mason').setup() end }

  use { "williamboman/mason-lspconfig.nvim", config = function() require('mason-lspconfig').setup() end }

  use { 'onsails/lspkind-nvim' }

  use { 'jose-elias-alvarez/null-ls.nvim' }

  use { 'tami5/lspsaga.nvim' }

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
      })
      vim.keymap.set(
        "",
        "<Leader>d",
        require("lsp_lines").toggle,
        { desc = "Toggle lsp_lines" }
      )
    end,
  })

  use { 'ray-x/lsp_signature.nvim', config = function()
    require "lsp_signature".setup({
      floating_window = true,
      use_lspsaga = false,
      hint_prefix = "🐰 ",
      transpancy = nil,
      zindex = 49,
      handler_opts = {
        border = "rounded"
      }
    })
  end }

  use { 'nvim-telescope/telescope-ui-select.nvim' }

  use { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('plugins_config/telescope-nvim')
    end
  }

  use { 'nvim-lualine/lualine.nvim',
    config = function()
      local navic = require("nvim-navic")
      local options = {
        theme = 'codedark',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
      }
      local sections = {
        lualine_a = {},
        lualine_c = { { 'filename', path = 1 },
          { navic.get_location, cond = navic.is_available, color = { fg = 'cyan' } } },
        lualine_z = { 'mode' }
      }
      local inactive_sections = {
        lualine_c = { { 'filename', path = 1 } }
      }

      require('lualine').setup { options = options, sections = sections, inactive_sections = inactive_sections }
    end
  }

  use { "lewis6991/gitsigns.nvim", config = function()
    require('plugins_config/gitsigns-nvim')
  end }

  use { 'kyazdani42/nvim-web-devicons' }

  use { 'ryanoasis/vim-devicons' }

  use { 'Shougo/vimproc.vim', run = 'make' }

  -- For Language
  use { 'posva/vim-vue', ft = { 'vue' } }

  use { 'mattn/emmet-vim', ft = { 'vue' } }

  use { "jose-elias-alvarez/nvim-lsp-ts-utils" }

  use { 'airblade/vim-rooter', config = function()
    vim.cmd([[
      let g:rooter_change_directory_for_non_project_files = 'current'
      let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'package.json']
    ]])
  end }

  use { 'tamago324/lir.nvim', config = function()
    require("plugins_config/lir-nvim")
  end }

  use { "akinsho/toggleterm.nvim", config = function()
    require("plugins_config.toggleterm-nvim")
  end }
  -- lua development
  use { "folke/lua-dev.nvim" }

  -- completion
  use { 'hrsh7th/cmp-nvim-lsp' }

  use { 'hrsh7th/vim-vsnip' }

  use { 'hrsh7th/vim-vsnip-integ' }

  use { 'hrsh7th/cmp-buffer' }

  use { 'hrsh7th/cmp-cmdline' }

  use { 'hrsh7th/cmp-path' }

  use { 'hrsh7th/cmp-vsnip' }

  use { 'hrsh7th/nvim-cmp',
    config = function()
      require("plugins_config/nvim-cmp")
    end
  }
end)
