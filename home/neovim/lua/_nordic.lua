require 'nordic' .setup {
    -- Telesccope custom configs.
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'classic',
    },
    -- Enable bold keywords.
    bold_keywords = true,
    -- Enable italicized comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = false,
    -- Override styling of any highlight group.
    -- (see next section for an example)
    override = {},
    cursorline = {
        bold = false,
        -- Avialable themes: 'dark', 'light'.
        theme = 'dark'
    }
}
