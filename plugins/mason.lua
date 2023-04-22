-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- ensure_installed = { "lua_ls" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = { "eslint_d", "stylelint", "prettierd" },
      handlers = {
        function()
        end,
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.formatting.eslint_d.with({
            condition = function(utils)
              return utils.has_file({ ".eslintrc.js" })
            end
          }))
        end,
        stylelint = function()
          require("null-ls").register(require("null-ls").builtins.formatting.stylelint.with({
            condition = function(utils)
              return utils.has_file({ ".stylelintrc.json" }) or utils.has_file({ ".stylelintrc" })
            end
          }))
        end,
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with({
            condition = function(utils)
              return utils.has_file({ ".prettierrc" })
            end
          }))
        end
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
