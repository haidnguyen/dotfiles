require("bufferline").setup({
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    }
  },
})
