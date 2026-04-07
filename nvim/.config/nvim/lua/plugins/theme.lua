return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      color_overrides = {
        mocha = {
          peach = "#ff9800",
          yellow = "#ffcc80",
        },
      },
      integrations = {
        telescope = true,
        which_key = true,
        mini = true,
      },
    },
  },
}
