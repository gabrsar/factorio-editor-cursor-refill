local refill = require("__editor-cursor-refill__/refill")
script.on_init(function()
  local inventory = game.create_inventory(1)
  local p = {valid=true, controller_type=defines.controllers.god, cursor_stack=inventory[1]}
  p.cursor_stack.set_stack{name="transport-belt", count=1}
  refill.player(p)
  assert(p.cursor_stack.count == 1, "refilled outside editor")
  p.controller_type = defines.controllers.editor
  p.cursor_stack.set_stack{name="transport-belt", count=1}
  refill.player(p)
  assert(p.cursor_stack.count == prototypes.item["transport-belt"].stack_size, "editor refill failed")
  p.cursor_stack.set_stack{name="transport-belt", count=2}
  refill.player(p)
  assert(p.cursor_stack.count == 2, "refilled too early")
  p.cursor_stack.set_stack{name="blueprint", count=1}
  refill.player(p)
  assert(p.cursor_stack.count == 1, "duplicated blueprint")
  p.cursor_stack.clear()
  refill.player(p)
  assert(not p.cursor_stack.valid_for_read, "restored intentionally cleared cursor")
  for i=1,1000 do
    p.cursor_stack.set_stack{name="transport-belt", count=1}
    refill.player(p)
    p.cursor_stack.count = p.cursor_stack.count - 1
    assert(p.cursor_stack.count > 0, "cursor exhausted")
  end
  p.cursor_stack.set_stack{name="transport-belt", count=1, quality="legendary"}
  refill.player(p)
  assert(p.cursor_stack.quality.name == "legendary", "quality changed")
  inventory.destroy()
  log("EDITOR_CURSOR_REFILL_TESTS_PASSED")
end)
