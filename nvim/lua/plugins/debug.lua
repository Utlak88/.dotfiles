return {
  "mfussenegger/nvim-dap-python",
  keys = {
    {
      mode = "n",
      "<leader>df",
      function()
        require("dap-python").test_method()
      end,
    },
  },
  config = function()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    require("dap-python").test_runner = "pytest"
  end,
}

