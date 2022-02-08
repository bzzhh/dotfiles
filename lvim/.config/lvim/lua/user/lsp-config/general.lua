lvim.lsp.diagnostics.virtual_text = true

lvim.lsp.on_attach_callback = function(client, _)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

vim.list_extend(lvim.lsp.override, { "cssls" })
