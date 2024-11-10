-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- keymaps.lua or your keymaps setup file

local nvim_tmux_nav = require'nvim-tmux-navigation'

vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { noremap = true, silent = true })
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { noremap = true, silent = true })
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { noremap = true, silent = true })
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { noremap = true, silent = true })
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, { noremap = true, silent = true })
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, { noremap = true, silent = true })


-- Command to copy the relative file path to clipboard
vim.api.nvim_create_user_command('CopyRelativePath', function()
    local relative_path = vim.fn.expand('%:p:~')
    vim.fn.setreg('+', relative_path)  -- Copy to clipboard
    print('Copied to clipboard: ' .. relative_path)
end, {})

-- Mapping for easy access (e.g., <leader>rp)
vim.api.nvim_set_keymap('n', '<leader>rp', ':lua vim.fn.setreg("+", vim.fn.expand("%:p:~"))<CR>:echo "Copied to clipboard!"<CR>', { noremap = true, silent = true })
