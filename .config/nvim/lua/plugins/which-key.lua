return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      "echasnovski/mini.icons",
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      
      -- Telescope mappings
      wk.register({
        ["<leader>"] = {
          c = {
            name = "colorscheme",
            s = { "<cmd>Telescope colorscheme<cr>", "show colorschemes" }
          },
          f = {
            name = "find",
            g = { "<cmd>Telescope live_grep<cr>", "live grep" }
          },
          h = {
            name = "help",
            t = { "<cmd>Telescope help_tags<cr>", "help tags" }
          },
          k = {
            name = "keymaps",
            m = { "<cmd>Telescope keymaps<cr>", "show keymaps" }
          },
          m = {
            name = "markdown",
            p = { "<cmd>MarkdownPreviewToggle<cr>", "toggle preview" }
          }
        }
      })
    end,
  },
} 
