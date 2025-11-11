return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap = require("dap")

    -- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    require("dap-python").setup("uv")

    dap.configurations.python = {
      {
        type = "pythonAttach",
        request = "attach",
        name = "Django: Attach to K3",
        django = true,
        subProcess = true,
        connect = {
          host = "localhost",
          port = 9292,
        },
        justMyCode = false,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/code",
          },
        },
      },
      {
        type = "python",
        request = "launch",
        name = "Pytest: Current File",
        module = "pytest",
        args = { "${file}", "-sv" },
        console = "integratedTerminal",
      },
      {
        type = "python",
        request = "launch",
        name = "Pytest: Current Test",
        module = "pytest",
        args = { "${file}", "::${test_name}", "-sv" },
        console = "integratedTerminal",
      },
    }

    dap.adapters.pythonAttach = {
      type = "server",
      host = "localhost",
      port = 9292,
    }
  end,
}
