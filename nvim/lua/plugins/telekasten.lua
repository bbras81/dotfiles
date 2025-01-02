return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local home = vim.fn.expand("~/Documents/notes") -- Caminho das suas notas
    require("telekasten").setup({
      home = home,
      dailies = home .. "/daily",
      weeklies = home .. "/weekly",
      templates = home .. "/templates",
    })
  end,
}
