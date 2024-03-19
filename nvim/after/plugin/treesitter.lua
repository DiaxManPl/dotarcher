require("nvim-treesitter.configs").setup({
  ensure_installed = {"javascript", "typescript", "lua", "qmldir", "qmljs"},
  highlight = { enable = true },
  indent = { enable = true },
})
