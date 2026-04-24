local M = {}

local state = {
	floating = {
		buf = nil,
		win = nil,
	},
}

local function create_floating_window(opts)
	opts = opts or {}

	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = opts.buf
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	})

	return { buf = buf, win = win }
end

local function get_cwd()
	local dir = vim.fn.expand("%:p:h")

	if dir == nil or dir == "" or vim.fn.isdirectory(dir) ~= 1 then
		return vim.fn.getcwd()
	end

	return dir
end

local function setup_terminal_autoclose(buf)
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		return
	end

	vim.api.nvim_buf_attach(buf, false, {
		on_detach = function()
			if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
				vim.schedule(function()
					vim.api.nvim_win_hide(state.floating.win)
				end)
			end
		end,
	})
end

function M.toggle()
	local cwd = get_cwd()

	if not state.floating.win or not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })

		vim.cmd.lcd(vim.fn.fnameescape(cwd))

		if
			not state.floating.buf
			or not vim.api.nvim_buf_is_valid(state.floating.buf)
			or vim.bo[state.floating.buf].buftype ~= "terminal"
		then
			vim.cmd("terminal")
			state.floating.buf = vim.api.nvim_get_current_buf()
			setup_terminal_autoclose(state.floating.buf)
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
		return
	end

	vim.api.nvim_set_current_win(state.floating.win)
	vim.cmd("startinsert")
end

return M
