local options = {
  view = {
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
  },
  renderer = {
    root_folder_label = ":t",

    icons = {
      show = {
        git = true,
      },
    },
  },
}

return options
