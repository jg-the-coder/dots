-- print("Hello from keymaps!")

-- QOL shortcuts
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<space>sf", "<cmd>source %<cr>", { desc = "[S]ource the current [f]ile" })
vim.keymap.set("n", "<space>x", ":.lua<cr>")
vim.keymap.set("v", "<space>x", ":lua<cr>")

vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current buffer" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bx", ":bd<cr>", opts) -- close buffer
vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>", opts) -- new buffer

-- Splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- close current tab

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

vim.keymap.set("n", "<leader>lu", ":Lazy update<cr>", { desc = "Update lazy.nvim" })

vim.keymap.set("n", ",p", '"0p', opts) -- paste last think yanked below
vim.keymap.set("n", ",P", '"0P', opts) -- paste last think yanked above

vim.keymap.set("n", "<leader>s", vim.cmd.up, opts)

vim.keymap.set("n", "<M-j>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<cr>")

-- better indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Centering
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("x", "p", '"_dp')
vim.keymap.set("x", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
vim.keymap.set("n", "YY", "va{Vy", opts)

-- Exit insert mode on jj and jk
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

---@diagnostic disable-next-line: unused-local
local job_id = 0
vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)

	---@diagnostic disable-next-line: unused-local
	job_id = vim.bo.channel
end, { desc = "Small terminal" })

vim.keymap.set("n", "mx", ":!chmod +x %<CR>", { noremap = true, silent = true })

-- Navigate buffers
vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- vim.keymap.set enter to ciw in normal mode
-- vim.keymap.set("n", "<CR>", "ciw", opts)
-- vim.keymap.set("n", "<BS>", "ci", opts)

vim.keymap.set("n", "<leader>rc", function()
	local file_name = vim.api.nvim_buf_get_name(0)
	local file_type = vim.bo.filetype

	if file_type == "lua" then
		-- Run the LUA file in the terminal
		vim.cmd("terminal lua " .. vim.fn.fnameescape(file_name))
	elseif file_type == "c" then
		-- Compile and run the C file in the terminal
		vim.cmd("terminal gcc " .. vim.fn.fnameescape(file_name) .. " -o result; ./result")
	elseif file_type == "cpp" then
		-- Compile and run the CPP file in the terminal
		vim.cmd("terminal g++ " .. vim.fn.fnameescape(file_name) .. " -o result; ./result")
	elseif file_type == "python" then
		-- Compile and run the PYHTON file in the terminal
		vim.cmd("terminal python3 " .. file_name)
	elseif file_type == "rust" then
		-- vim.cmd("rustc " .. file_name .. ";./" .. vim.fn.expand("%:t"))
		vim.cmd("terminal cargo run")

		-- 	local output_name = vim.fs.basename(file_name):gsub("%.rs$", "")
		-- 	vim.fn.jobstart("rustc " .. file_name, {
		-- 		on_exit = function(_, exit_code)
		-- 			if exit_code == 0 then
		-- 				-- Open a new terminal split and run the compiled binary
		-- 				vim.cmd("split | terminal ./" .. output_name)
		-- 			else
		-- 				print("Compilation failed")
		-- 			end
		-- 		end,
		-- 	})
	end -- Compile Rust file
end, { desc = "Run Code" })
