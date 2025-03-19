return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
    end,
    init = function()
      vim.cmd("colorscheme moonfly")
    end
  }
}
