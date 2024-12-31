return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      themable = true,
      separator = "slant",
      hover = {
        enable = true,
        delay = 200,
        reveal = {'close'}
      }
    },
  },
}
