local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local custom_on_attach = function(client, bufnr)
  --- Load mappings defined by which-key per buffer
  require("_which-key").lsp()

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local config = {
  on_attach = custom_on_attach,
  settings = {
    java = {
      autobuild = { enabled = true },
      signatureHelp = { enabled = true },
      saveActions = {
        organizeImports = true,
      },
      errors = {
        incompleteClasspath = {
          severity = "ignore",
        },
      },
      completion = {
        favoriteStaticMembers = {
          "fr.pmu.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
    },
  },

  cmd = {
    -- 💀
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Dosgi.checkConfiguration=true",
    "-Dosgi.sharedConfiguration.area=" .. jdtls_path .. "/share/config",
    "-Dosgi.sharedConfiguration.area.readOnly=true",
    "-Dosgi.configuration.cascaded=true",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Djavax.net.ssl.trustStore=/Users/cedric.mpassi/.local/certs/nexus.crt",
    "-Djavax.net.ssl.trustStorePassword=changeit",
    "-Djava.configuration.maven.userSettings=/Users/cedric.mpassi/.m2/settings.xml",
    "-javaagent:" .. lombok_path .. "/share/java/lombok.jar",

    -- 💀
    "-jar", vim.fn.glob(jdtls_path .. "/share/java/plugins/" .. "org.eclipse.equinox.launcher_*.jar"),

    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-configuration", vim.fn.expand("~/.cache/jdtls-config/"),

    -- 💀
    -- See `data directory configuration` section in the README
    "-data", vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
  capabilities = capabilities,
}

require("jdtls").start_or_attach(config)
