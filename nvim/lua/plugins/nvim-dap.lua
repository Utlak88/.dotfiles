return {
  { "nvim-neotest/nvim-nio" },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      dap.adapters.python = {
        type = 'server',
        host = 'localhost',
        port = 5678,  -- Same port as the debugpy server
      }

      dap.configurations.python = {
        {
          name = 'Server',
          type = 'python',
          request = 'attach',
          connect = {
            host = 'localhost',
            port = 5678,
          },
          pathMappings = {
            {
              localRoot = '',
              remoteRoot = '',
            },
          },
          django = true,
        }
      }

	  -- -- Function to run selected code in the debugger
	  -- function run_selected_code()
	  --   -- Get the start and end positions of the visual selection
	  --   local start_pos = vim.fn.getpos("'<")
	  --   local end_pos = vim.fn.getpos("'>")
	  --
	  --   -- Extract line numbers from positions
	  --   local start_line = start_pos[2]
	  --   local end_line = end_pos[2]
	  --
	  --   -- Get the lines in the selected range
	  --   local lines = vim.fn.getline(start_line, end_line)
	  --   local code = table.concat(lines, "\n")
	  --
	  --   -- Send the selected code to the debugger
	  --   -- Note: dap.run() may not directly support code execution like this.
	  --   -- You may need to adapt this to your specific needs or use another method.
	  --   -- require('dap').set_breakpoint()  -- Optional: set a breakpoint if desired
	  --   print("Code to run: \n" .. code)  -- Print code to verify
	  -- end
	  --
	  -- -- Key mapping to run selected code
	  -- vim.api.nvim_set_keymap('v', '<leader>rc', '<cmd>lua run_selected_code()<cr>', { noremap = true, silent = true, desc = 'Run Selected Code' })

	  -- Function to run highlighted code in DAP REPL
	  -- Define the function to run selected code in the REPL
	  -- local function run_selected_code()
	  --   local dap = require('dap')
	  --   local bufnr = vim.api.nvim_get_current_buf()
	  --   local start_line, end_line = vim.api.nvim_buf_get_mark(bufnr, '<'), vim.api.nvim_buf_get_mark(bufnr, '>')
	  --
	  --   if start_line[1] == 0 or end_line[1] == 0 then
	  --     print("No lines selected")
	  --     return
	  --   end
	  --
	  --   local lines = vim.api.nvim_buf_get_lines(bufnr, start_line[2], end_line[2] + 1, false)
	  --   local code = table.concat(lines, "\n")
	  --
	  --   dap.repl.input(code)
	  -- end
	  --
	  -- -- Key mappings
	  -- vim.api.nvim_set_keymap('v', '<Leader>dr', '<cmd>lua run_selected_code()<CR>', { noremap = true, silent = true, desc = 'Run selected code in DAP REPL' })
	  --

	  -- vim.keymap.set("x", "<leader>di", function()
	  --   local lines = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"))
	  --   dap.repl.open()
	  --   dap.repl.execute(table.concat(lines, "\n"))
	  -- end)

	  local dap = require('dap')

	  vim.keymap.set("x", "<leader>di", function()
	    local lines = vim.fn.getline(vim.fn.line("'<"), vim.fn.line("'>"))
	    local code = table.concat(lines, "\n")

	    -- Open the REPL
	    dap.repl.open()

	    -- Execute code in the REPL
	    dap.repl.execute(code)

	    -- Simulate pressing <leader>du twice
		vim.cmd('lua require("dapui").toggle()')
		vim.cmd('lua require("dapui").toggle()')
	    -- require('dap').repl.close()
	    -- Close the REPL buffer
	    -- local bufnr = vim.fn.bufnr('dap-repl')
	    -- if bufnr ~= -1 then
	    --   vim.api.nvim_buf_delete(bufnr, {force = true})
	    -- end
	  end, { noremap = true, silent = true, desc = "Run selected code and simulate leader du twice" })


	  -- vim.keymap.set("n", "<F5>", function()
	  --   require('dap').continue()
	  --   -- require('dap').repl.open()
	  --   -- require('dap').repl.close()
	  -- end, { noremap = true, silent = true, desc = "Continue Debugger" })
	  --


	  -- Key mappings
	  -- vim.api.nvim_set_keymap('v', '<Leader>rc', '<cmd>lua run_selected_code()<cr>', { noremap = true, silent = true, desc = 'Run Selected Code in DAP REPL' })


      -- Key mappings for nvim-dap
      vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>', { noremap = true, silent = true, desc = 'Toggle Breakpoint' })
      vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require("dap").step_over()<cr>', { noremap = true, silent = true, desc = 'Step Over' })
      vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require("dap").step_into()<cr>', { noremap = true, silent = true, desc = 'Step Into' })
      vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require("dap").step_out()<cr>', { noremap = true, silent = true, desc = 'Step Out' })
      vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require("dap").continue()<cr>', { noremap = true, silent = true, desc = 'Continue' })
      vim.api.nvim_set_keymap('n', '<leader>dt', '<cmd>lua require("dap").terminate()<cr>', { noremap = true, silent = true, desc = 'Terminate' })
      vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>lua require("dapui").toggle()<cr>', { noremap = true, silent = true, desc = 'Toggle DAP UI' })
	  -- Open the DAP REPL
	  vim.api.nvim_set_keymap('n', '<Leader>dr', '<cmd>lua require("dap").repl.open()<cr>', { noremap = true, silent = true, desc = 'Open DAP REPL' })

	  -- Run the last DAP session
	  vim.api.nvim_set_keymap('n', '<Leader>dl', '<cmd>lua require("dap").run_last()<cr>', { noremap = true, silent = true, desc = 'Run Last DAP Session' })

	  -- Hover over a variable or expression in visual mode
	  -- vim.api.nvim_set_keymap({'n', 'v'}, '<Leader>dh', '<cmd>lua require("dap.ui.widgets").hover()<cr>', { noremap = true, silent = true, desc = 'Hover Over Variable' })
	  --
	  -- -- Preview a variable or expression in visual mode
	  -- vim.api.nvim_set_keymap({'n', 'v'}, '<Leader>dp', '<cmd>lua require("dap.ui.widgets").preview()<cr>', { noremap = true, silent = true, desc = 'Preview Variable' })

	  -- Show the DAP frames in a centered float
	  vim.api.nvim_set_keymap('n', '<Leader>df', '<cmd>lua local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.frames)<cr>', { noremap = true, silent = true, desc = 'Show DAP Frames' })

	  -- Show the DAP scopes in a centered float
	  vim.api.nvim_set_keymap('n', '<Leader>ds', '<cmd>lua local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.scopes)<cr>', { noremap = true, silent = true, desc = 'Show DAP Scopes' })

      -- vim.api.nvim_set_keymap('n', '<F2>', '<cmd>lua require("dapui").run()<cr>', { noremap = true, silent = true, desc = 'Run code' })
      -- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      -- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      -- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      -- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      -- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
      -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
      -- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
      -- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
      -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    end
  },
  { "folke/neodev.nvim", opts = {} },
  {
    'rcarriga/nvim-dap-ui',
    requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require('dapui').setup()
	  require("neodev").setup({
	    library = { plugins = { "nvim-dap-ui" }, types = true },
	  })
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup()
    end
  }
}
