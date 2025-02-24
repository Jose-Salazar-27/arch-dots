-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp", -- lsp completion
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "saadparwaiz1/cmp_luasnip",
--     "L3MON4D3/LuaSnip", -- snippet engine
--   },
--   config = function()
--     local cmp = require("cmp")
--     cmp.setup({
--       mapping = {
--         ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
--         ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
--         ["<C-Space>"] = cmp.mapping.complete(), -- to open menu manually
--       },
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "buffer" },
--         { name = "path" },
--       },
--     })
--   end,
-- }
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind-nvim",
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {

          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },

        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      return require("plugins.configs.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
}
