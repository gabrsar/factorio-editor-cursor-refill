local M = {}

function M.player(player)
  if not player or not player.valid or player.controller_type ~= defines.controllers.editor then
    return
  end
  local stack = player.cursor_stack
  if not stack or not stack.valid_for_read or stack.count > 1 then
    return
  end
  -- Do not duplicate blueprints, equipment data, armor or selection tools.
  local allowed = stack.type == "item" or stack.type == "module" or stack.type == "ammo" or stack.type == "capsule" or stack.type == "tool"
  if allowed and stack.prototype.stack_size > 1 and stack.health == 1 then
    -- Changing only count keeps quality and the existing stack's metadata.
    stack.count = stack.prototype.stack_size
  end
end

function M.event(event)
  M.player(game.get_player(event.player_index))
end

return M
