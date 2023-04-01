return{
  {'mfussenegger/nvim-dap',
    ft = {'python'},
    dependencies = {
      {'rcarriga/nvim-dap-ui',
        config = function()
            require('dapui').setup()
        end
      },
      {'theHamsta/nvim-dap-virtual-text',
          config = function()
            require("nvim-dap-virtual-text").setup {
                enabled = true,                        -- enable this plugin (the default)
                enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true,               -- show stop reason when stopped for exceptions
                commented = false,                     -- prefix virtual text with comment string
                only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
                all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
                --- A callback that determines how a variable is displayed or whether it should be omitted
                --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
                --- @param buf number
                --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
                --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
                --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
                display_callback = function(variable, _buf, _stackframe, _node)
                  return variable.name .. ' = ' .. variable.value
                end,
            }
          end
      },

      {'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup('~/debugpy/Scripts/python')
        end
      },
    },
    config = function() -- abrir al iniciar
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        --dap.listeners.before.event_terminated["dapui_config"] = function()
        --  dapui.close()
        --end
        --dap.listeners.before.event_exited["dapui_config"] = function()
        --  dapui.close()
        --end

        --keymaps for dap 
        vim.api.nvim_set_keymap('n', '<leader>dt', ":lua require('dapui').toggle()<CR>", {noremap = true, desc = "[dap] Toggle DAP UI"})
        vim.api.nvim_set_keymap('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, desc = "[dap] Toggle breakpoint"})
        vim.api.nvim_set_keymap('n', '<leader>ds', ":lua require'dap'.continue()<CR>", {noremap = true, desc = "[dap] start the debbuging"})
        vim.api.nvim_set_keymap('n', '<leader>do', ":lua require'dap'.step_over()<CR>", {noremap = true, desc = "[dap] Step over"})
        vim.api.nvim_set_keymap('n', '<leader>di', ":lua require'dap'.step_into()<CR>", {noremap = true, desc = "[dap] Step into"})
        vim.api.nvim_set_keymap('n', '<leader>dd', ":lua require'dap'.disconnect()<CR>", {noremap = true, desc = "[dap] Stop debugging without close the interface"})
        vim.api.nvim_set_keymap('n', '<leader>dc', ":lua require'dap'.close()<CR>", {noremap = true, desc = "[dap] delete breakpoints"})
    end
  },
}
