return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Keymaps
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
      vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file explorer" })
      vim.keymap.set("n", "<leader>r", ":Neotree reveal<CR>", { desc = "Reveal current file" })

      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 35,
          position = "left",
          mappings = {
            ["<space>"] = "none",
          },
        },
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
            default = "",
          },
          git_status = {
            symbols = {
              added = "✚",
              modified = "●",
              deleted = "✖",
              renamed = "󰁕",
              untracked = "★",
              ignored = "◌",
              unstaged = "✗",
              staged = "✓",
              conflict = "!",
            },
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          use_libuv_file_watcher = true,
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["<space>"] = "none",
            },
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
        renderers = {
          directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            {
              "container",
              content = {
                { "name", zindex = 10 },
                { "diagnostics", errors_only = true, zindex = 20 },
                { "git_status", zindex = 20 },
              },
            },
          },
          file = {
            { "indent" },
            { "icon" },
            {
              "container",
              content = {
                { "name", zindex = 10 },
                { "diagnostics", errors_only = true, zindex = 20 },
                { "git_status", zindex = 20 },
              },
            },
          },
        },
        source_selector = {
          winbar = true,
          content_layout = "center",
          sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "buffers", display_name = " 󰈙 Buffers " },
            { source = "git_status", display_name = " 󰊢 Git " },
          },
        },
        highlights = {
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "NeoTreeRootFolder",
          "NeoTreeGitUntracked",
          "NeoTreeGitModified",
          "NeoTreeGitDeleted",
          "NeoTreeSpecialFile",
          "NeoTreeIndentMarker",
          "NeoTreeDimText",
          "NeoTreeFilterTerm",
          "NeoTreeExpander",
          "NeoTreeWinSeparator",
          "NeoTreeStatusLineNC",
          "NeoTreeStatusLine",
          "NeoTreeVertSplit",
          "NeoTreeWinBar",
          "NeoTreeWinBarNC",
        },
      })
    end,
  },
} 
