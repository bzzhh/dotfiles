local M = {}

M.config = function()
	lvim.builtin.which_key.mappings["H"] = {
		name = "Rest",
		e = { "<plug>RestNvim<cr>", "Execute" },
		p = { "<plug>RestNvimPreview<cr>", "Preview" },
		l = { "<plug>RestNvimLast<cr>", "Last" },
	}
end

return M
