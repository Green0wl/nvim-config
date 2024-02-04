ENABLE_AUTOFORMAT = false

vim.api.nvim_create_user_command('ToggleAutoformat', function()
  ENABLE_AUTOFORMAT = not ENABLE_AUTOFORMAT
end, {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
  -- This is where we attach the autoformatting for reasonable clients
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    local bufnr = args.buf

    local allowedClients = { "omnisharp" }
    -- Only attach to clients that support document formatting
    if not client.server_capabilities.documentFormattingProvider and not vim.tbl_contains(allowedClients, client.name) then
      return
    end

    -- Create an autocmd that will run *before* we save the buffer.
    --  Run the formatting command for the LSP that has just attached.
    vim.api.nvim_create_autocmd('BufWritePost', {
      buffer = bufnr,
      callback = function()
        if (not ENABLE_AUTOFORMAT) then return end

        vim.lsp.buf.format({ bufnr = bufnr })
        vim.cmd(":w")
        vim.diagnostic.enable(bufnr)
      end,
    })
  end,
})
