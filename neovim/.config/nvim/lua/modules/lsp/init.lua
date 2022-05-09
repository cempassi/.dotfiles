local lspconfig = require("lspconfig")
local lspsaga = require 'lspsaga'
local hover = require("lspsaga.hover")
local codeaction = require("lspsaga.codeaction")
local sig_help = require("lspsaga.signaturehelp")
local rename = require("lspsaga.rename")
local diagnostic = require("lspsaga.diagnostic")

require("modules.lsp._diagnostic") -- diagnostic stuff

require"lspsaga".init_lsp_saga({
  border_style = "single",
}) -- initialise lspsaga UI

local custom_on_attach = function(client, bufnr)
  --- In lsp attach function
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>cn", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "x", "<leader>cA", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>ce", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>cr", "<cmd>Telescope lsp_references<cr>", {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",{silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Down>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {silent = true, noremap = true})
  vim.keymap.set('i', '<leader>cs', sig_help.signature_help)
  vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting )
  vim.keymap.set('n', '<leader>ci', require("lspsaga.provider").preview_definition)
  vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition)
  vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting)
  vim.keymap.set('n', '<leader>ce', diagnostic.show_line_diagnostics)

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

end

local custom_on_init = function()
  print("Language Server Protocol started!")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.bashls.setup{
  on_attach = custom_on_attach
}

lspconfig.yamlls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilites,
  root_dir = vim.loop.cwd,
  settings = {
    yaml = {
      schemaStore = {
        enable = true
      }
    }
  }
}

lspconfig.vimls.setup{
  on_attach = custom_on_attach
}

lspconfig.tsserver.setup{
  filetypes = { "javascript", "typescript", "typescriptreact" },
  on_attach = function(client)
    mappings.lsp_mappings()
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
  end,
  on_init = custom_on_init,
  root_dir = vim.loop.cwd,
}

lspconfig.jdtls.setup{
  cmd = {"jdtls"},
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  settings = {
    java = {
      errors = {
        incompleteClasspath = {
          severity = "ignore"
        }
      }
    }
  }
}

lspconfig.html.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.cssls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.rust_analyzer.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities,

  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehaviour = "full",
      },

      callInfo = {
        full = true,
      };

      cargo = {
        loadOutDirsFromCheck = true
      },

      checkOnSave = {
        allFeatures = true,
        overrideCommand = {
          'cargo', 'clippy', '--workspace', '--message-format=json',
          '--all-targets', '--all-features'
        }
      },

      procMacro = {
        enable = true,
      },
    },
  },
}

lspconfig.terraformls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.vuels.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.clangd.setup({
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    --"--header-insertion=iwyu",
  },
  init_options = {
    clangdFileStatus = true
  },
})

-- local sumneko_root = os.getenv("HOME") .. "/Applications/lua-language-server"
-- lspconfig.sumneko_lua.setup{
--   cmd = {
--     sumneko_root
--     .. "/bin/macOS/lua-language-server", "-E",
--     sumneko_root .. "/main.lua"
--   },
--   on_attach = custom_on_attach,
--   on_init = custom_on_init,
--   settings = {
--     Lua = {
--       runtime = { version = "LuaJIT", path = vim.split(package.path, ";"), },
--       diagnostics = {
--         enable = true,
--         globals = {
--           "vim", "describe", "it", "before_each", "after_each",
--           "awesome", "theme", "client", "P", "use"
--         },
--         workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     }
--   }
--   }
-- }

require'lspconfig'.pyright.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}
