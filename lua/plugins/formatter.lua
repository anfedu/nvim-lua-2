local tempdir = "/tmp"

require("format").setup({
    ["*"] = {
        { cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
    },
    vim = {
        {
            cmd = { "luafmt -w replace" },
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$",
        },
    },
    lua = {
        {
            cmd = {
                function(file)
                    local config = vim.loop.os_homedir() .. "/.config/nvim/.stylua.toml"
                    return string.format("stylua --config-path %s %s %s ", config, file, file)
                end,
            },
            tempfile_dir = tempdir,
        },
    },
    go = { { cmd = { "gofmt -w", "goimports -w" }, tempfile_postfix = ".tmp" } },
    vimwiki = {
        {
            cmd = { "prettier -w --parser babel" },
            start_pattern = "^{{{javascript$",
            end_pattern = "^}}}$",
        },
    },
    json = { { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } } },
    javascript = { { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } } },
    typescript = { { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } } },
    javascriptreact = {
        { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } },
    },
    typescriptreact = {
        { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } },
    },
    graphql = { { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } } },
    yaml = { { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } } },
    markdown = { { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } } },
})
