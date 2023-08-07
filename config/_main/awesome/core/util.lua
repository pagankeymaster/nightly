---@diagnostic disable: undefined-field
local M = {}

local Gears = require("gears")
local Awful = require("awful")
local Path = require("path")

local Gio = require("lgi").Gio

local functional = require("core.functional")
local std = require("core.std")

function M.stem(path) return std.string.split(Path.basename(path), ".", { plain = true })[1] end

function M.apply_bindings(grouped_bindings, mouse, callback)
  local function spawn_wrap(cmd) return function() Awful.spawn(cmd) end end
  mouse = functional.if_nil(mouse, false)
  local wrapped_types = { "string", "table" }
  std.table.foreach(functional.if_nil(grouped_bindings, {}), function(group, bindings)
    std.table.foreachi(bindings, function(_, binding)
      binding.group = group
      if Gears.table.hasitem(wrapped_types, type(binding.on_press)) then
        binding.on_press = spawn_wrap(binding.on_press)
      end
      if Gears.table.hasitem(wrapped_types, type(binding.on_release)) then
        binding.on_release = spawn_wrap(binding.on_release)
      end
      if mouse then
        callback(Awful.button(binding))
      else
        callback(Awful.key(binding))
      end
    end)
  end)
end

function M.get_icon_theme(icon_theme)
  local IconTheme = require("bling.helpers.icon_theme")
  return IconTheme(icon_theme)
end

function M.get_current_icon_theme_name()
  local settings = Gio.Settings.new("org.gnome.desktop.interface")
  return settings:get_string("icon-theme")
end

return M
