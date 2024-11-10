return {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", '<leader>cu', "<CMD>UndotreeToggle<CR>", { desc = "UndotreeToggle" })
    end
}
