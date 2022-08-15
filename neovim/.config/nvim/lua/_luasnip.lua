local luasnip = require("luasnip")
local snip = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node

luasnip.filetype_extend("telekasten", { "markdown" })


luasnip.config.set_config({
	history = true,
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 200,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = false,
	store_selection_keys = "<c-s>",
})

-- Date Helper function
local date = function()
    return { os.date "%Y-%m-%d" }
end

luasnip.add_snippets(nil, {
	markdown = {
		-- Select link, press C-s, enter link to receive snippet
		snip({
			trig = "codewrap",
			namr = "markdown_code_wrap",
			dscr = "Create markdown code block from existing text",
		}, {
			text("``` "),
			insert(1, "Language"),
			text({ "", "" }),
			func(function(_, snip)
				local tmp = {}
				tmp = snip.env.TM_SELECTED_TEXT
				tmp[0] = nil
				return tmp or {}
			end, {}),
			text({ "", "```", "" }),
			insert(0),
		}),
		snip({
			trig = "codeempty",
			namr = "markdown_code_empty",
			dscr = "Create empty markdown code block",
		}, {
			text("``` "),
			insert(1, "Language"),
			text({ "", "" }),
			insert(2, "Content"),
			text({ "", "```", "" }),
			insert(0),
		}),
		snip({
			trig = "meta",
			namr = "Metadata",
			dscr = "Yaml metadata format for markdown",
		}, {
			text({ "---", "title: " }),
			insert(1, "note_title"),
			text({ "", "author: cempassi"}),
      text({"", "created: "}),
      func(date, {}),
			text({ "", "aliases: [" }),
			insert(2, ""),
			text({ "]", "tags: [" }),
			insert(3),
			text({ "]", "---", "" }),
			insert(0),
		}),
	},
})

