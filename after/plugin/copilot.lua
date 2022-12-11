-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "~", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.cmd([[highlight CopilotSuggestion guifg=#ae7c66 ctermfg=8]])

--setup copilot
vim.cmd([[autocmd FileType xml setlocal omnifunc=v:lua.copilot#Complete]])
vim.cmd([[autocmd FileType xml setlocal completefunc=v:lua.copilot#Complete]])
vim.cmd([[autocmd FileType xml setlocal completeopt=menuone,noselect]])

