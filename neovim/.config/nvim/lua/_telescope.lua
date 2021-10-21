-- Telescope settings
local actions = require('telescope.actions')

require('telescope').setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["d"] = "delete_buffer",
        }
      }
    },
    lsp_code_actions = {
      theme = "cursor",
      previewer = false,
      initial_mode = "normal",
      layout_config = {
        prompt_position = "top"
      }
    }
  },
  defaults = {
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "bottom"
    },
    git_icons = {added = "☺", changed = "ƣ", deleted = "ㄐ"},
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<leader>q"] = actions.close,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default + actions.center,
        ["<leader>hs"] = actions.select_horizontal,
        ["<leader>vs"] = actions.select_vertical,
        ["<leader>te"] = actions.select_tab,

        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,

      },

      n = {
        ["<leader>q"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      }
    }
  }
}

require('telescope').load_extension('gh')
