local plugins = {
  { "catppuccin/nvim", name = "catpuccin" },
  { 
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}

return plugins
