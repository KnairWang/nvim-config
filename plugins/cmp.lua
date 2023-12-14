local cmp = require "cmp"
local types = require("cmp.types")
local luasnip = require "luasnip"

-- Text = 1,
-- Method = 2,
-- Function = 3,
-- Constructor = 4,
-- Field = 5,
-- Variable = 6,
-- Class = 7,
-- Interface = 8,
-- Module = 9,
-- Property = 10,
-- Unit = 11,
-- Value = 12,
-- Enum = 13,
-- Keyword = 14,
-- Snippet = 15,
-- Color = 16,
-- File = 17,
-- Reference = 18,
-- Folder = 19,
-- EnumMember = 20,
-- Constant = 21,
-- Struct = 22,
-- Event = 23,
-- Operator = 24,
-- TypeParameter = 25,

local function prioritize(kind, higher)
  return function(entry1, entry2)
    local kind1 = entry1:get_kind()
    local kind2 = entry2:get_kind()
    if kind1 ~= kind2 then
      if kind1 == kind then
        return higher
      elseif kind2 == kind then
        return not higher
      end
    end
    return nil
  end
end

local function lexicographical(entry1, entry2)
  if entry1:get_word() and entry2:get_word() then
    local diff = vim.stricmp(entry1:get_word(), entry2:get_word())
    if diff < 0 then
      return true
    elseif diff > 0 then
      return false
    end
  end
  return nil
end

local function entry_filter(entry, cts)
  return true
end

return {
  "hrsh7th/nvim-cmp",
  opts = {
    sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000, entry_filter = entry_filter },
      { name = "luasnip",  priority = 750 },
      -- { name = "buffer", priority = 500 },
      { name = "path",     priority = 250 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.exact,
        prioritize(types.lsp.CompletionItemKind.Snippet, false),
        cmp.config.compare.sort_text,
        prioritize(types.lsp.CompletionItemKind.Field, true),
        prioritize(types.lsp.CompletionItemKind.Variable, true),
        prioritize(types.lsp.CompletionItemKind.Function, true),
        prioritize(types.lsp.CompletionItemKind.Property, true),
        prioritize(types.lsp.CompletionItemKind.Method, true),
        cmp.config.compare.kind,
        cmp.config.compare.order,

        lexicographical,
        -- cmp.config.compare.score,
        -- cmp.config.compare.length,
        -- cmp.config.compare.offset,
        -- cmp.config.compare.scopes,
        -- cmp.config.compare.recently_used,
        -- cmp.config.compare.locality,
      },
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        -- if luasnip.expand_or_jumpable() then
        --   luasnip.expand_or_jump()
        -- else
          fallback()
        -- end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        fallback()
      end, { "i", "s" }),
    },
  }
}
