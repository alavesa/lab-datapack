# Custom machine models

Since v0.12 the working machines are **real container blocks** (their vanilla GUI is
the interface) dressed up by `item_display` models:

| Machine | Block (GUI) | Display model | Base item + CMD string |
|---|---|---|---|
| Compound Creator | dispenser | *(vanilla look)* | — |
| Centrifuge | dropper | drum on top (scale 0.55) | `grindstone` + `lab_centrifuge` |
| Lab Fridge | barrel | wrap-around cabinet | `iron_block` + `lab_fridge` |
| Gas Burner | furnace | *(vanilla look — it lights up!)* | — |
| Tube Rack | *(none)* | rack + interaction entity | `oak_planks` + `lab_rack` |

The fridge model extends slightly past the block bounds (−0.4…16.4) so the barrel is
completely hidden inside; displays have no hitbox, so right-clicks pass through to
the real container GUI.

## Swap in your own Blockbench models

1. In [Blockbench](https://www.blockbench.net/), make a **Java Block/Item** model.
   For the fridge, keep it *larger* than the 16³ block so the barrel stays hidden.
2. Save over `resource-pack/assets/lab/models/block/centrifuge.json`, `fridge.json`
   or `rack.json`. Vanilla textures (`minecraft:block/...`) work; own PNGs go under
   `resource-pack/assets/lab/textures/`.
3. Re-zip the **contents** of `resource-pack/` (pack.mcmeta at the zip root).

## Glassware

Compound containers are potion items with `custom_model_data` strings
`lab_test_tube` / `lab_flask`; the models keep the **potion liquid tint**, so each
compound's color shows in the tube. Replace the four PNGs under
`assets/lab/textures/item/` to restyle them (keep alpha binary). The pipette is a
plain single-layer item texture (`lab_pipette`).

## History

v0.4–v0.11 used the mob-spawner custom-block method (invisible spawner + display +
interaction). It's retired: GUI blocks made the spawner unnecessary, and dungeon
spawners render normally again.
