return {
  on_attach = function(client, bufnr)
    -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1492605642
    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
    for i, v in ipairs(tokenModifiers) do
      local tmp = string.gsub(v, ' ', '_')
      tokenModifiers[i] = string.gsub(tmp, '-_', '')
    end
    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
    for i, v in ipairs(tokenTypes) do
      local tmp = string.gsub(v, ' ', '_')
      tokenTypes[i] = string.gsub(tmp, '-_', '')
    end
    on_attach(client, bufnr)
  end
}
