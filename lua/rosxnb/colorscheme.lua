local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
}

function M.config()
    -- vim.api.nvim_set_hl(  0,  "NormalFloat",  { bg = "none" }  )
    -- vim.api.nvim_set_hl(  0,  "Normal",       { bg = "none" }  )
    -- vim.api.nvim_set_hl(  0,  "NormalNC",     { bg = "none" }  )
    -- vim.api.nvim_set_hl(  0,  "NonText",      { bg = "none" }  )
    -- vim.api.nvim_set_hl(  0,  "SignColumn",   { bg = "none" }  )

    require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = true, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
    })

    vim.cmd.colorscheme "catppuccin"

    vim.api.nvim_create_user_command("LightMode", function()
        require("catppuccin").setup({ transparent_background = false })
        vim.opt.background = "light"
        vim.cmd.colorscheme "catppuccin"
    end, {})

    vim.api.nvim_create_user_command("DarkMode", function()
        require("catppuccin").setup({ transparent_background = true })
        vim.opt.background = "dark"
        vim.cmd.colorscheme "catppuccin"
    end, {})
end

return M
