local util = require("tokyonight.util")

local M = {}

local function generate_players_json(colors)
  local playerColors = {}

  for _, color in ipairs(colors.rainbow) do
    table.insert(playerColors, {
      background = color,
      cursor = color,
      selection = util.blend(color, 0.2, colors.bg),
    })
  end

  local playersJson = "[\n"
  for i, player in ipairs(playerColors) do
    local isLast = i == #playerColors
    playersJson = playersJson
      .. string.format(
        [[          {
            "background": "%s",
            "cursor": "%s",
            "selection": "%s"
          }%s]],
        player.background,
        player.cursor,
        player.selection,
        isLast and "" or ","
      )
      .. "\n"
  end
  playersJson = playersJson .. "        ]"

  return playersJson
end

--- @param colors ColorScheme
function M.generate(colors, groups, opts)
  colors = vim.deepcopy(colors)
  colors["_appearance"] = opts.style == "day" and "light" or "dark"

  local elements = { "comments", "keywords", "functions", "variables" }
  for _, elem in ipairs(elements) do
    colors[elem .. "_style"] = (opts.styles[elem] and opts.styles[elem].italic) and '"italic"' or "null"
    colors[elem .. "_bold"] = (opts.styles[elem] and opts.styles[elem].bold) and "700" or "null"
  end

  colors["_players"] = generate_players_json(colors)

  local zed = util.template([[
{
  "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
  "name": "${_style_name}",
  "author": "Folke Lemaitre",
  "themes": [
    {
      "name": "${_style_name}",
      "appearance": "${_appearance}",
      "accents": ["${blue}", "${yellow}", "${green}", "${teal}", "${magenta}", "${purple}", "${orange}", "${red}"],
      "style": {
        "background": "${bg}",
        "border": "${dark3}",
        "border.disabled": "${terminal_black}",
        "border.focused": "${blue}",
        "border.selected": "${blue}",
        "border.transparent": "#00000000",
        "border.variant": "${bg_highlight}",
        "conflict": "${yellow}",
        "conflict.background": "${bg_dark}",
        "conflict.border": "${yellow}",
        "created": "${green}",
        "created.background": "${bg_dark}",
        "created.border": "${green}",
        "deleted": "${red}",
        "deleted.background": "${bg_dark}",
        "deleted.border": "${red}",
        "drop_target.background": "${fg_dark}",
        "editor.active_line_number": "${orange}",
        "editor.active_wrap_guide": "${fg}",
        "editor.background": "${bg}",
        "editor.foreground": "${fg}",
        "editor.hover_line_number": "${fg_dark}",
        "editor.invisible": "${comment}",
        "editor.line_number": "${fg_gutter}",
        "editor.wrap_guide": "${fg}",
        "editor.active_line.background": "${bg_highlight}",
        "editor.document_highlight.bracket_background": "${bg_highlight}",
        "editor.document_highlight.read_background": "${bg_highlight}",
        "editor.document_highlight.write_background": "${bg_highlight}",
        "editor.gutter.background": "${bg}",
        "editor.highlighted_line.background": "${bg_dark}",
        "editor.subheader.background": "${bg_dark}",
        "editor.indent_guide": "${terminal_black}",
        "editor.indent_guide_active": "${blue5}",
        "element.active": "${fg_gutter}",
        "element.background": "${bg_dark}",
        "element.disabled": "${bg_dark}",
        "element.hover": "${bg_highlight}",
        "element.selected": "${fg_gutter}",
        "elevated_surface.background": "${bg_dark}",
        "error": "${red1}",
        "error.background": "${bg_dark}",
        "error.border": "${red}",
        "ghost_element.background": "#00000000",
        "ghost_element.hover": "${bg_highlight}",
        "ghost_element.active": "${fg_gutter}",
        "ghost_element.selected": "${fg_gutter}",
        "ghost_element.disabled": "${bg_dark}",
        "hidden": "${comment}",
        "hidden.background": "${bg}",
        "hidden.border": "${terminal_black}",
        "hint": "${teal}",
        "hint.background": "${bg_dark1}",
        "hint.border": "${blue7}",
        "icon": "${fg}",
        "icon.accent": "${blue}",
        "icon.disabled": "${comment}",
        "icon.placeholder": "${fg_dark}",
        "icon.muted": "${fg_dark}",
        "ignored": "${comment}",
        "ignored.background": "${bg}",
        "ignored.border": "${dark3}",
        "info": "${blue}",
        "info.background": "${bg_dark1}",
        "info.border": "${blue7}",
        "link_text.hover": "${blue}",
        "modified": "${yellow}",
        "modified.background": "${bg_dark}",
        "modified.border": "${yellow}",
        "panel.background": "${bg_dark}",
        "panel.focused_border": "${blue}",
        "panel.indent_guide": "${terminal_black}",
        "panel.indent_guide_active": "${blue5}",
        "players": ${_players},
        "predictive": "${dark5}",
        "predictive.background": "${bg_dark}",
        "predictive.border": "${green}",
        "renamed": "${blue}",
        "renamed.background": "${bg_dark1}",
        "renamed.border": "${blue7}",
        "scrollbar.thumb.background": "${fg}",
        "scrollbar.thumb.border": "${bg_highlight}",
        "scrollbar.thumb.hover_background": "${bg_highlight}",
        "scrollbar.track.background": "#00000000",
        "scrollbar.track.border": "${bg_dark1}",
        "search.match_background": "${bg_search}",
        "status_bar.background": "${bg}",
        "success": "${green}",
        "success.background": "${bg_dark}",
        "success.border": "${green}",
        "surface.background": "${bg_dark}",
        "syntax": {
          "attribute": {
            "color": "${teal}", 
            "font_style": null,
            "font_weight": null
          },
          "boolean": {
            "color": "${orange}", 
            "font_style": null,
            "font_weight": null
          },
          "comment": {
            "color": "${comment}",
            "font_style": ${comments_style},
            "font_weight": ${comments_bold}
          },
          "comment.doc": {
            "color": "${yellow}",
            "font_style": null,
            "font_weight": null
          },
          "constant": {
            "color": "${orange}",
            "font_style": null,
            "font_weight": null
          },
          "constructor": {
            "color": "${magenta}",
            "font_style": null,
            "font_weight": null
          },
          "embedded": {
            "color": "${cyan}",
            "font_style": null,
            "font_weight": null
          },
          "emphasis": {
            "color": null,
            "font_style": "italic",
            "font_weight": null
          },
          "emphasis.strong": {
            "color": null,
            "font_style": null,
            "font_weight": 700
          },
          "enum": {
            "color": "${blue1}",
            "font_style": null,
            "font_weight": null
          },
          "function": {
            "color": "${blue}",
            "font_style": ${functions_style},
            "font_weight": ${functions_bold}
          },
          "function.builtin": {
            "color": "${blue1}",
            "font_style": ${functions_style},
            "font_weight": ${functions_bold}
          },
          "hint": {
            "color": "${teal}",
            "font_style": null,
            "font_weight": 700
          },
          "keyword": {
            "color": "${purple}",
            "font_style": ${keywords_style},
            "font_weight": ${keywords_bold}
          },
          "label": {
            "color": "${blue}",
            "font_style": null,
            "font_weight": null
          },
          "link_text": {
            "color": "${teal}",
            "font_style": "italic",
            "font_weight": null
          },
          "link_uri": {
            "color": "${teal}",
            "font_style": null,
            "font_weight": null
          },
          "number": {
            "color": "${orange}",
            "font_style": null,
            "font_weight": null
          },
          "operator": {
            "color": "${blue5}",
            "font_style": null,
            "font_weight": null
          },
          "predictive": {
            "color": "${dark5}",
            "font_style": "italic",
            "font_weight": null
          },
          "preproc": {
            "color": "${cyan}",
            "font_style": null,
            "font_weight": null
          },
          "primary": {
            "color": "${fg}",
            "font_style": null,
            "font_weight": null
          },
          "property": {
            "color": "${green1}",
            "font_style": null,
            "font_weight": null
          },
          "punctuation": {
            "color": "${fg_dark}",
            "font_style": null,
            "font_weight": null
          },
          "punctuation.bracket": {
            "color": "${fg_dark}",
            "font_style": null,
            "font_weight": null
          },
          "punctuation.delimiter": {
            "color": "${blue5}",
            "font_style": null,
            "font_weight": null
          },
          "punctuation.list_marker": {
            "color": "${fg}",
            "font_style": null,
            "font_weight": null
          },
          "punctuation.special": {
            "color": "${blue5}",
            "font_style": null,
            "font_weight": null
          },
          "string": {
            "color": "${green}",
            "font_style": null,
            "font_weight": null
          },
          "string.escape": {
            "color": "${magenta}",
            "font_style": null,
            "font_weight": null
          },
          "string.regex": {
            "color": "${blue6}",
            "font_style": null,
            "font_weight": null
          },
          "string.special": {
            "color": "${magenta}",
            "font_style": null,
            "font_weight": null
          },
          "string.special.symbol": {
            "color": "${orange}",
            "font_style": null,
            "font_weight": null
          },
          "tag": {
            "color": "${red}",
            "font_style": null,
            "font_weight": null
          },
          "text.literal": {
            "color": "${blue}",
            "font_style": null,
            "font_weight": null
          },
          "title": {
            "color": "${blue}",
            "font_style": null,
            "font_weight": 700
          },
          "type": {
            "color": "${blue1}",
            "font_style": null,
            "font_weight": null
          },
          "variable": {
            "color": "${fg}",
            "font_style": ${variables_style},
            "font_weight": ${variables_bold}
          },
          "variable.special": {
            "color": "${red}",
            "font_style": null,
            "font_weight": null
          },
          "variant": {
            "color": "${blue}",
            "font_style": null,
            "font_weight": null
          }
        },
        "tab.active_background": "${bg_dark1}",
        "tab.inactive_background": "${bg_dark}",
        "tab_bar.background": "${bg_dark}",
        "terminal.background": "${bg_dark1}",
        "terminal.bright_foreground": "${fg}",
        "terminal.dim_foreground": "${bg_dark1}",
        "terminal.foreground": "${fg}",
        "terminal.ansi.black": "${bg_dark1}",
        "terminal.ansi.bright_black": "${comment}",
        "terminal.ansi.dim_black": "${bg_dark1}",
        "terminal.ansi.red": "${red}",
        "terminal.ansi.bright_red": "${red1}",
        "terminal.ansi.dim_red": "${red}",
        "terminal.ansi.green": "${green}",
        "terminal.ansi.bright_green": "${green1}",
        "terminal.ansi.dim_green": "${green}",
        "terminal.ansi.yellow": "${yellow}",
        "terminal.ansi.bright_yellow": "${yellow}",
        "terminal.ansi.dim_yellow": "${yellow}",
        "terminal.ansi.blue": "${blue}",
        "terminal.ansi.bright_blue": "${blue1}",
        "terminal.ansi.dim_blue": "${blue}",
        "terminal.ansi.magenta": "${magenta}",
        "terminal.ansi.bright_magenta": "${purple}",
        "terminal.ansi.dim_magenta": "${magenta}",
        "terminal.ansi.cyan": "${cyan}",
        "terminal.ansi.bright_cyan": "${blue6}",
        "terminal.ansi.dim_cyan": "${cyan}",
        "terminal.ansi.white": "${fg}",
        "terminal.ansi.bright_white": "${fg}",
        "terminal.ansi.dim_white": "${fg_dark}",
        "text": "${fg}",
        "text.accent": "${blue}",
        "text.disabled": "${comment}",
        "text.muted": "${fg_dark}",
        "text.placeholder": "${comment}",
        "title_bar.background": "${bg}",
        "title_bar.inactive_background": "${bg_dark}",
        "toolbar.background": "${bg_dark1}",
        "unreachable": "${fg_dark}",
        "unreachable.background": "${bg}",
        "unreachable.border": "${dark3}",
        "version_control.added": "]] .. util.blend_bg(colors.git.add, 0.5) .. [[",
        "version_control.modified": "${git.change}",
        "version_control.deleted": "${git.delete}",
        "warning": "${yellow}",
        "warning.background": "${bg_dark}",
        "warning.border": "${yellow}"
      }
    }
  ]
}
]], colors)
  return zed
end

return M
