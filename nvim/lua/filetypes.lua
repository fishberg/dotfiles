vim.filetype.add({
  pattern = {
    -- detect any file prefixed by config under ~/.ssh
    [".*/%.ssh/.*config.*"] = "sshconfig",

    -- detect realpath of symlinked files in my dotfile repo
    [".*/ssh/.*/config.d/.*config.*"] = "sshconfig",
  },
})
