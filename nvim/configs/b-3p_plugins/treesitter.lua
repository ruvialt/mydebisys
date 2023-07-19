require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "html", "json", "lua",
    "markdown", "markdown_inline",
    "python", "vim", "yaml"
  },

  highlight = { enable = true },
}
