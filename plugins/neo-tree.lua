local nt = require("plugins.neo-tree")

if nt.opts.filesystem == nil then
  nt.opts.filesystem = {}
end

nt.opts.filesystem.filtered_items = { visible = true }

return nt
