local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  colors = vim.deepcopy(colors)

  local pi = util.template(
    [[{
  "$schema": "https://raw.githubusercontent.com/badlogic/pi-mono/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json",
  "name": "${_name}",
  "colors": {
    "accent": "${blue}",
    "border": "${black}",
    "borderAccent": "${border_highlight}",
    "borderMuted": "${dark3}",
    "success": "${green}",
    "error": "${red1}",
    "warning": "${yellow}",
    "muted": "${fg_dark}",
    "dim": "${comment}",
    "text": "${fg}",
    "thinkingText": "${fg_dark}",

    "selectedBg": "${bg_highlight}",
    "userMessageBg": "${bg_dark}",
    "userMessageText": "${fg}",
    "customMessageBg": "${bg_highlight}",
    "customMessageText": "${fg}",
    "customMessageLabel": "${blue1}",
    "toolPendingBg": "${bg_highlight}",
    "toolSuccessBg": "${diff.add}",
    "toolErrorBg": "${diff.delete}",
    "toolTitle": "${blue5}",
    "toolOutput": "${fg_dark}",

    "mdHeading": "${blue}",
    "mdLink": "${teal}",
    "mdLinkUrl": "${comment}",
    "mdCode": "${green}",
    "mdCodeBlock": "${fg}",
    "mdCodeBlockBorder": "${dark5}",
    "mdQuote": "${fg_dark}",
    "mdQuoteBorder": "${fg_gutter}",
    "mdHr": "${fg_gutter}",
    "mdListBullet": "${blue5}",

    "toolDiffAdded": "${green1}",
    "toolDiffRemoved": "${red1}",
    "toolDiffContext": "${fg_dark}",

    "syntaxComment": "${comment}",
    "syntaxKeyword": "${cyan}",
    "syntaxFunction": "${blue}",
    "syntaxVariable": "${fg}",
    "syntaxString": "${green}",
    "syntaxNumber": "${orange}",
    "syntaxType": "${blue1}",
    "syntaxOperator": "${blue5}",
    "syntaxPunctuation": "${fg_dark}",

    "thinkingOff": "${dark5}",
    "thinkingMinimal": "${blue7}",
    "thinkingLow": "${blue0}",
    "thinkingMedium": "${blue}",
    "thinkingHigh": "${blue1}",
    "thinkingXhigh": "${cyan}",

    "bashMode": "${magenta}"
  },
  "export": {
    "pageBg": "${bg}",
    "cardBg": "${bg_dark}",
    "infoBg": "${bg_highlight}"
  }
}]],
    colors
  )

  return pi
end

return M
