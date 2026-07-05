# Custom tube models

The lab-tube look lives in `resource-pack/` and works by overriding the **copper grate**
block model. Two levels of customization:

## Level 1: swap the texture

Replace `resource-pack/assets/lab/textures/block/lab_tube.png` with your own 16×16 PNG.
Keep alpha **binary** (fully opaque or fully transparent pixels) — grates render on the
cutout layer, so semi-transparent pixels won't blend, they snap to visible/invisible.

## Level 2: real 3D model (Blockbench)

1. In [Blockbench](https://www.blockbench.net/), create a **Java Block/Item** model.
   Model a tube shell: e.g. an outer frame `0,0,0 → 16,16,16` with 2-px walls and a
   cylinder-ish bore approximated with boxes. Stay inside the 16³ block bounds so
   neighbouring tubes connect seamlessly.
2. Export and save it over
   `resource-pack/assets/minecraft/models/block/copper_grate.json`.
   Point its textures at `lab:block/...` files you add under
   `resource-pack/assets/lab/textures/block/`.
3. Zip the **contents** of `resource-pack/` (pack.mcmeta at the zip root) and drop the
   zip into `.minecraft/resourcepacks/`.

## Which blocks to override

| Block model | Affects | Suggested use |
|---|---|---|
| `copper_grate.json` | copper grate + waxed copper grate | main lab tube (this pack) |
| `exposed_copper_grate.json` | exposed + waxed exposed | second line, e.g. cargo |
| `weathered_copper_grate.json` | weathered + waxed weathered | third line, e.g. hazmat |
| `oxidized_copper_grate.json` | oxidized + waxed oxidized | fourth line |

Waxed variants reuse the unwaxed model files, so one override covers both — and waxed
never oxidizes, so **use waxed grates when building** if you want the look to stay put.

All grate variants are already in the `#pneumatic:tube` tag, so capsules route through
any of them with no datapack changes.

## No per-block custom models?

Correct — `custom_model_data` only exists for items. A block retexture applies to every
copper grate in the world. If you need per-tube visuals beyond the four grate variants,
that's display-entity-shell territory (one `item_display` per tube block) — doable, but
it needs a placement tool and costs an entity per block. Open an issue if you want it.
