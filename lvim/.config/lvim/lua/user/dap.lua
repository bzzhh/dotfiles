local M = {}

M.config = function()
	local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
	local function sep_os_replacer(str)
		local result = str
		local path_sep = package.config:sub(1, 1)
		result = result:gsub("/", path_sep)
		return result
	end
	local join_path = require("lvim.utils").join_paths

	local status_ok, dap = pcall(require, "dap")
	if not status_ok then
		return
	end

	if vim.fn.executable("lldb-vscode") == 1 then
		dap.adapters.lldbrust = {
			type = "executable",
			attach = { pidProperty = "pid", pidSelect = "ask" },
			command = "lldb-vscode",
			env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
		}
		dap.adapters.rust = dap.adapters.lldbrust
		dap.configurations.rust = {
			{
				type = "rust",
				request = "launch",
				name = "lldbrust",
				program = function()
					local metadata_json = vim.fn.system("cargo metadata --format-version 1 --no-deps")
					local metadata = vim.fn.json_decode(metadata_json)
					local target_name = metadata.packages[1].targets[1].name
					local target_dir = metadata.target_directory
					return target_dir .. "/debug/" .. target_name
				end,
				args = function()
					local inputstr = vim.fn.input("Params: ", "")
					local params = {}
					local sep = "%s"
					for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
						table.insert(params, str)
					end
					return params
				end,
			},
		}
	end
end

return M
