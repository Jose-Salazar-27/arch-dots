return {
  "akinsho/git-conflict.nvim",
  event = "BufReadPre",
  config = {
    -- disable buffer local mapping created by this plugin
    default_mappings = true,

    -- disable commands created by this plugin
    default_commands = true,

    -- This will disable the diagnostics in a buffer whilst it is conflicted
    disable_diagnostics = false,

    -- command or function to open the conflicts list
    list_opener = "copen",
    highlights = {
      incoming = "DiffAdd",
      current = "DiffText",
    },
  },
}
