return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95, -- Shade the backdrop of the Zen window
      width = 370, -- Width of the Zen window
      height = 1, -- Height of the Zen window
      options = {
        -- Uncomment or add options you want to change in Zen mode
        -- signcolumn = "no", -- Disable signcolumn
        -- number = false, -- Disable number column
        -- relativenumber = false, -- Disable relative numbers
        -- cursorline = false, -- Disable cursorline
        -- cursorcolumn = false, -- Disable cursor column
        -- foldcolumn = "0", -- Disable fold column
        -- list = false, -- Disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- Disables the ruler text in the cmd line area
        showcmd = false, -- Disables the command in the last line of the screen
        laststatus = 0, -- Turn off the statusline in Zen mode
      },
      twilight = { enabled = true }, -- Enable Twilight when Zen mode opens
      gitsigns = { enabled = false }, -- Disables git signs
      tmux = { enabled = true }, -- Disables the tmux statusline
      todo = { enabled = false }, -- Disable todo-comments.nvim highlights
      kitty = {
        enabled = false,
        font = "+4", -- Font size increment
      },
      alacritty = {
        enabled = false,
        font = "14", -- Font size
      },
      wezterm = {
        enabled = false,
        font = "+4", -- Font size increment
      },
      neovide = {
        enabled = false,
        scale = 1.2, -- Scale factor
        disable_animations = {
          neovide_animation_length = 0,
          neovide_cursor_animate_command_line = false,
          neovide_scroll_animation_length = 0,
          neovide_position_animation_length = 0,
          neovide_cursor_animation_length = 0,
          neovide_cursor_vfx_mode = "",
        }
      },
    },
    on_open = function(win)
      -- Custom code when Zen window opens
    end,
    on_close = function()
      -- Custom code when Zen window closes
    end,
  },
  config = function()
      vim.keymap.set("n", '<leader>cz', "<CMD>ZenMode<CR>", { desc = "Open parent directory" })
  end
}
