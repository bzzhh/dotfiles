local M = {}

M.config = function()
	lvim.builtin.which_key.mappings["H"] = {
		name = "Rest",
		e = { "<plug>RestNvim<cr>", "Execute" },
		p = { "<plug>RestNvimPreview<cr>", "Preview" },
		l = { "<plug>RestNvimLast<cr>", "Last" },
	}
	lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
	lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
    lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm<CR>"
	lvim.builtin.which_key.mappings["l"]["f"] = {
		function()
			require("lvim.lsp.utils").format({ timeout_ms = 5000 })
		end,
		"Format",
	}
end

return M
