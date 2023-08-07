local M = {}

local Gears = require("gears")

local functional = require("core.functional")
local std = require("core.std")
local util = require("core.util")
local environ = require("core.enum").environ

M._defaults = {
  modules = {
    variables = {
      theme = "radium",
      icon_theme = util.get_current_icon_theme_name(),
      terminal = functional.if_nil(environ.TERMINAL, "xterm"),
      editor = functional.if_nil(environ.EDITOR, "nano"),
      modkey = "Mod4",
    },
    wibars = {
      tag = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    },
  },
}

M._defaults.modules.variables.editor_cmd = M._defaults.modules.variables.terminal .. " -e " .. M._defaults.modules.variables.editor
M._current = Gears.table.clone(M._defaults, true)

function M.merge(options)
  M._current = std.table.deep_extend("keep", functional.if_nil(options, {}), M._current)
  return M._current
end

function M.extend(options) return std.table.deep_extend("keep", functional.if_nil(options, {}), M._current) end

function M.get() return M._current end

return M
