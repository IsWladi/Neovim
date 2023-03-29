return{
  {'mfussenegger/nvim-dap',
    dependencies = {
      {'rcarriga/nvim-dap-ui',
        config = function()
            require('dapui').setup()
        end
      },
      {'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup('~/debugpy/Scripts/python')
        end
      },
    },
    config = function() -- cerrar interfaz al terminar debug y abrir al iniciar
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
    end
  },
}
