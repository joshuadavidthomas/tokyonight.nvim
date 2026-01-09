local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
--- @return table<string, string>
local function generate_defs(colors)
  local defs = {}

  for key, value in pairs(colors) do
    -- Skip keys that start with underscore (metadata) and "none"
    if not key:match("^_") and key ~= "none" then
      if type(value) == "string" then
        defs[key] = value
      elseif type(value) == "table" then
        -- Handle nested tables like git, diff, terminal
        for subkey, subvalue in pairs(value) do
          if type(subvalue) == "string" then
            defs[key .. "_" .. subkey] = subvalue
          end
        end
      end
    end
  end

  return defs
end

--- @param defs table<string, string>
--- @param indent number Number of spaces to indent
--- @return string
local function format_defs_json(defs, indent)
  local defs_lines = {}

  -- Sort keys for consistent output
  local sorted_keys = {}
  for k in pairs(defs) do
    table.insert(sorted_keys, k)
  end
  table.sort(sorted_keys)

  for _, k in ipairs(sorted_keys) do
    table.insert(defs_lines, string.format('%s"%s": "%s"', string.rep(" ", indent), k, defs[k]))
  end

  return table.concat(defs_lines, ",\n")
end

--- @param colors ColorScheme
function M.generate(colors)
  colors = vim.deepcopy(colors)

  local defs = generate_defs(colors)
  colors.pi_defs = format_defs_json(defs, 4)

  local pi = util.template(
    [[{
  "$schema": "https://raw.githubusercontent.com/badlogic/pi-mono/main/packages/coding-agent/theme-schema.json",
  "name": "${_name}",
  "vars": {
${pi_defs}
  },
  "colors": {
    "accent": "blue",
    "border": "black",
    "borderAccent": "border_highlight",
    "borderMuted": "dark3",
    "success": "green",
    "error": "red1",
    "warning": "yellow",
    "muted": "fg_dark",
    "dim": "comment",
    "text": "fg",
    "thinkingText": "fg_dark",

    "selectedBg": "bg_highlight",
    "userMessageBg": "bg_dark",
    "userMessageText": "fg",
    "customMessageBg": "bg_highlight",
    "customMessageText": "fg",
    "customMessageLabel": "blue1",
    "toolPendingBg": "bg_highlight",
    "toolSuccessBg": "diff_add",
    "toolErrorBg": "diff_delete",
    "toolTitle": "blue5",
    "toolOutput": "fg",

    "mdHeading": "blue",
    "mdLink": "teal",
    "mdLinkUrl": "teal",
    "mdCode": "green",
    "mdCodeBlock": "fg",
    "mdCodeBlockBorder": "dark5",
    "mdQuote": "fg_dark",
    "mdQuoteBorder": "fg_gutter",
    "mdHr": "fg_gutter",
    "mdListBullet": "blue5",

    "toolDiffAdded": "green1",
    "toolDiffRemoved": "red1",
    "toolDiffContext": "fg_dark",

    "syntaxComment": "comment",
    "syntaxKeyword": "cyan",
    "syntaxFunction": "blue",
    "syntaxVariable": "fg",
    "syntaxString": "green",
    "syntaxNumber": "orange",
    "syntaxType": "blue1",
    "syntaxOperator": "blue5",
    "syntaxPunctuation": "fg_dark",

    "thinkingOff": "dark5",
    "thinkingMinimal": "blue7",
    "thinkingLow": "blue0",
    "thinkingMedium": "blue",
    "thinkingHigh": "blue1",
    "thinkingXhigh": "cyan",

    "bashMode": "magenta"
  },
  "export": {
    "pageBg": "bg",
    "cardBg": "bg_dark",
    "infoBg": "bg_highlight"
  }
}]],
    colors
  )

  return pi
end

return M
