vim.filetype.add({
  pattern = {
    [".*/%.ssh/config.*"] = "sshconfig", -- detect any file prefixed by config under ~/.ssh
    [".*/ssh/.*/config.d/config.*"] = "sshconfig", -- detect realpath of symlinked files in my dotfile repo
  },
})
