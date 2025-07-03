local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  colors = vim.deepcopy(colors)

  local color_list = {}

  -- Collect all colors in a flat list
  for name, value in pairs(colors) do
    if not name:match("^_") and name ~= "none" and type(value) == "string" and value:match("^#") then
      table.insert(color_list, { name = name, hex = value:gsub("^#", "") })
    end
  end

  -- Handle nested color tables
  for name, value in pairs(colors) do
    if type(value) == "table" and not name:match("^_") then
      for subname, subvalue in pairs(value) do
        if type(subvalue) == "string" and subvalue:match("^#") then
          local varname = name .. "_" .. subname
          table.insert(color_list, { name = varname, hex = subvalue:gsub("^#", "") })
        end
      end
    end
  end

  -- Sort colors alphabetically by name
  table.sort(color_list, function(a, b)
    return a.name < b.name
  end)

  -- Generate output lines
  local lines = {}
  for _, color in ipairs(color_list) do
    table.insert(lines, string.format("$%s = rgb(%s)", color.name, color.hex))
    table.insert(lines, string.format("$%sAlpha = %s", color.name, color.hex))
    table.insert(lines, "")
  end

  return table.concat(lines, "\n")
end

return M
