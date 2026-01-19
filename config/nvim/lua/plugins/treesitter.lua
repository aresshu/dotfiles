local opts = {
  ensure_installed = {
    -- Languages
    "lua",
    "javascript",
    "typescript",
    "html",
    "css",
    "sql",
    "rust",
    "cpp",
    "python",

    -- Frameworks
    "svelte",
    "astro",

    -- DevOps
    "terraform",
  },
  indent = { enable = true },
}

local function config()
  require("nvim-treesitter.configs").setup(opts)
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = config
}
