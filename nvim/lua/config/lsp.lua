--[[ local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        'lua_ls',
        'clangd',
        'rust_analyzer',
        'jdtls',
        'zls'
    }
}) ]]

local lspsaga = require('lspsaga')

lspsaga.setup({
    move_in_saga = { prev = '<C-k>', next = '<C-j>' },
    finder_action_keys = { open = '<CR>' },
    definition_action_keys = { edit = '<CR>' },
})

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local keymap = vim.keymap

local on_attach = function(ev)
    local bufnr = ev.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "[D", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = on_attach,
})

-- used for autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["clangd"].setup({
    capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
})

lspconfig["zls"].setup({
    capabilities = capabilities,
})

lspconfig["nil_ls"].setup({
    capabilities = capabilities,
})

lspconfig["dartls"].setup({
    capabilities = capabilities,
})

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            }
        }
    }
})
