local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  colors = vim.deepcopy(colors)
  colors["_theme_name"] = colors["_name"]:gsub("_", "-")

  local posting = util.template(
    [[
name: ${_theme_name}
author: Folke Lemaitre
homepage: https://github.com/folke/tokyonight.nvim

primary: '${blue}'      # blue
# primary: '${yellow}'  # yellow
# primary: '${green}'   # green
# primary: '${teal}'    # teal
# primary: '${magenta}' # magenta
# primary: '${purple}'  # purple
# primary: '${orange}'  # orange
# primary: '${red}'     # red

accent: '${border_highlight}'
background: '${bg_dark}'
secondary: '${fg}'
surface: '${bg}'

error: '${error}'
success: '${green1}'
warning: '${warning}'

syntax:
  json_key: '${teal}'
  json_number: '${orange}'
  json_string: '${green}'
  json_boolean: '${orange}'
  json_null: '${blue}'

text_area:
  cursor: 'reverse'
  cursor_line_gutter: 'bold ${orange}'
  selection: 'on ${bg_visual}'
  gutter: '${fg_gutter}'
  matched_bracket: '${orange}'

url:
  base: 'bold italic ${orange}'
  protocol: 'italic ${comment}']],
    colors
  )

  return posting
end

return M
