return {
    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    path_components = 1,
                    separator_style = "thin",
                    always_show_bufferline = true,

                    show_buffer_close_icons = true, 
                    show_close_icon = false, 

                   
                    buffer_close_icon = '●',
                    modified_icon = '●',
                },
                
                highlights = {
                    close_button = {
                        fg = '#ff5555',
                    },
                    close_button_selected = {
                        fg = '#ff5555',
                    },
                    close_button_visible = {
                        fg = '#ff5555',
                    },

                    modified = {
                        fg = '#ffb86c',
                    },
                    modified_selected = {
                        fg = '#ffb86c',
                    },
                    modified_visible = {
                        fg = '#ffb86c',
                    },
                }
            })
        end,
    },
}
