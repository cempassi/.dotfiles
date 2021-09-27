require('neoscroll').setup({
    hide_cursor = false,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "circular",        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
})

local t = {}

t['<leader>mu'] = {'scroll', {'-vim.wo.scroll', 'true', '350'}}
t['<leader>md'] = {'scroll', {'vim.wo.scroll', 'true', '350'}}
t['<leader>mb'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '550'}}
t['<leader>mf'] = {'scroll', {'vim.api.nvim_win_get_height(0)', 'true', '550'}}
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}

require('neoscroll.config').set_mappings(t)
