return {
  "Almo7aya/openingh.nvim",
    config = function()
      require("kubectl").setup(
        {
            -- for repository page
            -- vim.keymap.set("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>gr", ":OpenInGHRepo <CR>", { silent = true, noremap = true }),

            -- for current file page
            vim.keymap.set("n", "<Leader>gt", ":OpenInGHFile <CR>", { silent = true, noremap = true }),
            vim.keymap.set("n", "<Leader>gp", ":OpenInGHFileLines <CR>", { silent = true, noremap = true })
        }
      )
    end,
}

