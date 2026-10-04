# Editor Cursor Refill

A small mod for **Factorio 2.1** that automatically refills stackable items in your cursor while using `/editor`.

When the cursor stack reaches **one item**, the mod restores it to the item's normal stack size. You can keep building without selecting the item again. The existing item's quality is preserved.

## Installation

1. Download `editor-cursor-refill_1.0.0.zip` from this repository's Releases.
2. Copy the ZIP into your Factorio `mods` directory (`%APPDATA%\Factorio\mods` on Windows).
3. Enable **Editor Cursor Refill** in the Mods menu and restart Factorio.
4. Open a game, enter `/editor`, and select a stackable item.

The mod only acts while the player's controller is the map editor. Clearing the cursor intentionally does not restore an item. Blueprints, books, planners, armor, items with entity data, damaged items, and items whose stack size is one are excluded.

## Build

Run `./scripts/package.ps1` with PowerShell from the repository root. The ZIP is written to `dist/` with the version read from `info.json`. Only runtime files are included.

## Validation

The runtime logic was tested in Factorio **2.1.20** using real item stacks and a test player table representing editor and non-editor controllers. The checks covered refill at one item, no refill at two, no refill outside the editor, exclusion of blueprints, intentional cursor clearing, 1,000 repeated refills, and preservation of legendary quality.

The in-game interface and paused-editor event delivery have not been manually verified. The test harness in `tests/` can be loaded as a separate development mod alongside this mod; do not install it for ordinary play.

## License

MIT.
