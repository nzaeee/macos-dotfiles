return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")

      -- Color table for highlights
      local colors = {
        bg = "#202328",
        fg = "#bbc2cf",
        yellow = "#ECBE7B",
        cyan = "#008080",
        darkblue = "#081633",
        green = "#98be65",
        orange = "#FF8800",
        violet = "#a9a1e1",
        magenta = "#c678dd",
        blue = "#51afef",
        red = "#ec5f67",
      }

      lualine.setup({
        options = {
          theme = {
            normal = {
              a = { fg = colors.fg, bg = colors.bg },
              b = { fg = colors.fg, bg = colors.bg },
              c = { fg = colors.fg, bg = colors.bg },
            },
            insert = {
              a = { fg = colors.bg, bg = colors.green },
              b = { fg = colors.fg, bg = colors.bg },
              c = { fg = colors.fg, bg = colors.bg },
            },
            visual = {
              a = { fg = colors.bg, bg = colors.magenta },
              b = { fg = colors.fg, bg = colors.bg },
              c = { fg = colors.fg, bg = colors.bg },
            },
            replace = {
              a = { fg = colors.bg, bg = colors.red },
              b = { fg = colors.fg, bg = colors.bg },
              c = { fg = colors.fg, bg = colors.bg },
            },
          },
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { left = "" },
              right_padding = 2,
            },
          },
          lualine_b = {
            {
              "branch",
              "diff",
              "diagnostics",
              separator = { left = "" },
              right_padding = 2,
            },
          },
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 1,
              symbols = {
                modified = " ●",
                readonly = "",
                unnamed = "",
              },
            },
          },
          lualine_x = {
            {
              "encoding",
              separator = { left = "" },
              right_padding = 2,
            },
            {
              "filetype",
              separator = { left = "" },
              right_padding = 2,
            },
            {
              "progress",
              separator = { left = "" },
              right_padding = 2,
            },
            {
              "location",
              separator = { left = "" },
              right_padding = 2,
            },
          },
          lualine_y = {
            {
              "spaces",
              separator = { left = "" },
              right_padding = 2,
            },
          },
          lualine_z = {
            {
              "datetime",
              style = "%H:%M",
              separator = { left = "" },
              right_padding = 2,
            },
          },
        },
      })
    end,
  },
  -- Bottom bar and command line
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          format = {
            cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "󰍉", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "󰍉", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
            input = {},
          },
        },
        messages = {
          enabled = true,
          view = "notify",
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        popupmenu = {
          enabled = true,
          backend = "nui",
          kind_icons = {},
          relative = "editor",
        },
        redirect = {
          view = "popup",
          filter = { event = "msg_show" },
        },
        commands = {
          history = {
            view = "split",
            opts = { enter = true },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "error", kind = "error" },
                { event = "lsp", kind = "message" },
              },
            },
          },
          last = {
            view = "popup",
            opts = { enter = true },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "error", kind = "error" },
                { event = "lsp", kind = "message" },
              },
            },
            filter_opts = { count = 1 },
          },
          errors = {
            view = "popup",
            opts = { enter = true },
            filter = { error = true },
            filter_opts = { reverse = true },
          },
        },
        notify = {
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 1000 / 30,
            view = "mini",
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
            silent = false,
            view = nil,
            opts = {},
            keymaps = {
              ["<C-h>"] = "actions",
              ["<C-k>"] = "close",
              ["<CR>"] = "actions",
            },
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true,
              luasnip = true,
              throttle = 50,
              relative = true,
            },
            view = nil,
            opts = {},
            keymaps = {
              ["<C-h>"] = "actions",
              ["<C-k>"] = "close",
              ["<CR>"] = "actions",
            },
          },
          message = {
            enabled = true,
            view = "notify",
            opts = {},
          },
          documentation = {
            view = "hover",
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
            after = function(_, result)
              if not result then return end
              if not vim.b[result.bufnr] then return end
              vim.b[result.bufnr].lsp_completion_documentation = result
            end,
          },
        },
        markdown = {
          hover = {
            ["|(%S-)|"] = vim.cmd.help,
            ["%[%[([%w_-]+)%]%]"] = require("noice.util").markdown_links,
            ["%[([%w_-]+)%]%(([%w_-]+)%)"] = require("noice.util").markdown_links,
          },
          highlights = {
            ["|%S-|"] = "@text.reference",
            ["@%S+"] = "@parameter",
            ["^%s*(Parameters:)"] = "@text.title",
            ["^%s*(Return:)"] = "@text.title",
            ["^%s*(See also:)"] = "@text.title",
            ["{%S-}"] = "@parameter",
          },
        },
        health = {
          checker = true,
        },
        smart_move = {
          enabled = true,
          excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
        throttle = 1000 / 30,
      })
    end,
  },
} 
