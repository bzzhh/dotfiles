lvim.lsp.diagnostics.virtual_text = true

lvim.lsp.on_attach_callback = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
		vim.diagnostic.disable(bufnr)
		vim.defer_fn(function()
			vim.diagnostic.reset(nil, bufnr)
		end, 1000)
	end
end

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cssls" })
