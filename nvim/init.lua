-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This will show hidden files
      hide_dotfiles = false, -- This will prevent hiding dotfiles
    },
  },
})