-- print("Hello from autocmds!")

-- Don't auto insert comment leader on new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = augroup,
  desc = 'Use q to close the window',
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- Highlight when yanking (copying) text
-- See "h vim.hl"
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ higroup = "Visual", timeout = 250 })
	end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.cmd([[autocmd TermOpen term://* startinsert]])

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.rs",
	callback = function()
		vim.cmd("silent! !cargo fmt -- {expand('%')}")
	end,
})
