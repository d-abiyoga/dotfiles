local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle"}
local root_dir = require('jdtls.setup').find_root()

local config = {
    cmd = {'/Users/spaceman/.local/share/nvim/mason/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
