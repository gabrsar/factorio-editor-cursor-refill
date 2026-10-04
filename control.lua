local refill = require("refill")

script.on_event({
  defines.events.on_player_cursor_stack_changed,
  defines.events.on_player_toggled_map_editor,
  defines.events.on_player_controller_changed,
  defines.events.on_pre_build,
  defines.events.on_player_built_tile,
  defines.events.on_player_used_capsule,
}, refill.event)
