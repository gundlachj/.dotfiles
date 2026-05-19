local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Manual LSP configuration
vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    root_markers = { '.luarc.json', '.luarc.jsonrc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
    filetypes = { 'lua' },
})
vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    root_markers = { 'Cargo.toml', 'Cargo.lock', '.git' },
    filetypes = { 'rust' },
})

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(env)
        -- Set up LSP keymaps
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = env.buf })
        vim.keymap.set("n", "<leader>ra", vim.lsp.buf.code_action, { buffer = env.buf })
        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = env.buf })
        vim.keymap.set("n", "<leader>ri", vim.lsp.buf.implementation, { buffer = env.buf })
        vim.keymap.set("n", "<leader>rt", vim.lsp.buf.type_definition, { buffer = env.buf })
        vim.keymap.set("n", "<leader>rs", vim.lsp.buf.document_symbol, { buffer = env.buf })
        vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { buffer = env.buf })
        vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format, { buffer = env.buf })

        vim.lsp.completion.enable(true, env.data.client_id, env.buf, { autotrigger = false })
    end,
})

-- Enable treesitter parsing
vim.api.nvim_create_autocmd("FileType", {
    callback = function(env)
        pcall(vim.treesitter.start, env.buf)
    end
})
