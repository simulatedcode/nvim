-- Auto source when there are changes in plugins.lua
local group = vim.api.nvim_create_augroup("PackerGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile profile=true",
  group = group,
})

require("packer").startup({
  function(use)
    -- Packer
    use({ "wbthomason/packer.nvim" })
    use("lewis6991/impatient.nvim")

    -- NvimTree
    use({ "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
    })
    -- Options
    use({ "nvim-lua/plenary.nvim" }) -- Plugins
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lualine/lualine.nvim" }) -- Lualine Statusline
    use({ "lukas-reineke/indent-blankline.nvim" }) -- Indentline
    use({ "numToStr/Comment.nvim" }) -- Comment
    use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- Context Commentstring
    use({ "akinsho/toggleterm.nvim" }) -- Multiple Terminal
    use({ "windwp/nvim-autopairs" }) -- Autopairs
    use({ "windwp/nvim-ts-autotag" }) -- Autotags
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
    use({ 'norcalli/nvim-colorizer.lua' }) -- colorizer

    -- Colorscheme
    use({ "projekt0n/github-nvim-theme" })
    use({ "folke/tokyonight.nvim" })
    --use { "lunarvim/darkplus.nvim" }

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Telescope
    use({ "nvim-telescope/telescope.nvim" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })

    -- Cmp
    use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer" }) -- buffer completions
    use({ "hrsh7th/cmp-path" }) -- path completions
    use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })

    -- Snippets
    use({ "L3MON4D3/LuaSnip" }) --snippet engine
    use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

    -- Git
    use({ "lewis6991/gitsigns.nvim" })
    use({ "dinhhuy258/git.nvim" })

    -- Mardown Preview
    use({ "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
    })

    -- Statusline
    use({ "stevearc/aerial.nvim",
      config = function()
        require("aerial").setup()
      end,
    })
    -- Copilot
    use({ "github/copilot.vim" })

    -- managing & installing lsp servers, linters & formatters
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
    use("neovim/nvim-lspconfig") -- easily configure language servers
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use { "nvim-lua/lsp-status.nvim" }
    use({ "RRethy/vim-illuminate" })


    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
  end,

  config = {
    profile = { enable = true },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      removed_sym = "",
      moved_sym = "",
      prompt_border = "rounded",
      keybindings = {
        quit = "q",
        toggle_info = "<cr>",
        diff = "=",
        prompt_revert = "r",
      },
    },
  },
})
