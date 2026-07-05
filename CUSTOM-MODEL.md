# Custom machine models (the mob-spawner method)

The centrifuge and fridge are "custom blocks" built the classic map-maker way:

1. **A mob spawner block** provides the physical block (collision, mining). The
   resource pack overrides `assets/minecraft/models/block/spawner.json` with an empty
   model, so the spawner renders **nothing**.
2. **An `item_display`** inside the block shows the 3D model. It holds a base item
   (grindstone / iron block) whose `custom_model_data` string (`lab_centrifuge`,
   `lab_fridge`) selects the custom model via the item definition files.
3. **An `interaction` entity** (1.05 × 1.02) wraps the block and catches right-clicks;
   the datapack resolves the clicking player with `execute on target`.

Without the resource pack everything still works — you just see a spawner cage with a
grindstone / iron block floating in it.

## Swap in your own Blockbench models

1. In [Blockbench](https://www.blockbench.net/), make a **Java Block/Item** model.
   Stay roughly inside the block (coordinates -16…32 are allowed — the fridge example
   is 22 high). You can reference vanilla textures (`minecraft:block/...`) or add your
   own PNGs under `resource-pack/assets/lab/textures/`.
2. Save it over `resource-pack/assets/lab/models/block/centrifuge.json` or
   `fridge.json`.
3. Re-zip the **contents** of `resource-pack/` (pack.mcmeta at the zip root) into
   `.minecraft/resourcepacks/`.

The shipped examples are hand-built from vanilla textures (smooth stone, iron,
blackstone, quartz) so they look decent with zero custom textures.

## Adding a new machine

1. Model: `resource-pack/assets/lab/models/block/mymachine.json`.
2. Dispatch: add a case to an item definition under
   `resource-pack/assets/minecraft/items/` mapping a new `custom_model_data` string.
3. Datapack: copy the `place/` + `machine/` pattern — setblock spawner, summon the
   display with your CMD string, summon the interaction, handle clicks in `tick`.

## Known tradeoffs

- The invisible-spawner override hits **every spawner in the world** — dungeon and
  trial-chamber spawners included (they still work, you just don't see the cage).
  That is the price of the mob-spawner method; it's cosmetic only.
- Machine models don't rotate to face the player yet — design them to look good from
  all sides, or add a `rotation` to the display's summon in `place/do_place`.
