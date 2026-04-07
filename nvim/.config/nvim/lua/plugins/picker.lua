return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          follow = true,
          exclude = {
            ".local",
            ".steam",
            ".cache",
            "ca-certificates",
          },
        },
      },
    },
  },
}
