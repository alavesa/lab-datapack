# Custom Models & Animations — how it works and how to import them

This server renders **custom 3D models and animations with no client mod**. Two techniques:

1. **CustomModelData** — a normal item (e.g. a Wooden Hoe, or Leather Horse Armor) is given a
   `custom_model_data` tag; the resource pack maps that tag to a 3D model. The client sees the vanilla
   item but renders your AK-47 (or rig part) instead.
2. **Display-entity puppets** — the player is made invisible and a rig of **ItemDisplay** parts is
   spawned on them; the server positions/rotates the parts every tick (quaternions/Euler), teleporting
   with 1-tick interpolation, so the vanilla client renders smooth animation.

---

## Recommended software

- **Blockbench** (free) — model + animate. The standard tool for Minecraft Java models.
- **Animated Java** (free Blockbench plugin) — exports your Blockbench animations as a **data pack +
  resource pack** that plays them on **display entities, server-side, no client mod**. This is the
  pipeline that matches how this server animates.
- **ModelEngine** (Ticxo, paid) — an all-in-one alternative with its own API, if you'd rather not
  hand-manage rigs.

Use **Blockbench + Animated Java**. Blockbench does the modelling/animating; the plugins just trigger
the clips.

---

## A. Importing a static custom item (gun, tool, prop)

1. Blockbench: `New → Java Item Model`, build it, `File → Export → Export Model`.
2. Drop into a resource-pack source (any folder in `Lab/tools/build-pack.sh` SOURCES, e.g. `Guns/resource-pack`):
   - model:   `assets/<ns>/models/item/<name>.json`
   - texture: `assets/<ns>/textures/item/<name>.png`
   - dispatch:`assets/minecraft/items/<base_item>.json` — a `minecraft:select` on
     `minecraft:custom_model_data` with a case `"<name>"` → your model, `fallback` = the vanilla item.
3. Rebuild: `bash /Users/piia/Lab/tools/build-pack.sh` (publishes to `pack-latest`).
4. Point the feature at it (e.g. a gun's `model:` in `guns.yml`, or an attachment's `item-model`).

The build script **merges** dispatch cases across packs, so multiple plugins can add cases to the same
base item (e.g. `paper.json`).

---

## B. The player rig (display-entity puppet)

`/lab rig [player]` turns a player into an **invisible body + 6 ItemDisplay parts**:

| part          | custom_model_data | notes                         |
|---------------|-------------------|-------------------------------|
| head          | `rig_head`        | follows look yaw + pitch      |
| torso         | `rig_torso`       | follows body yaw              |
| arm_left      | `rig_arm_left`    | swings (opposite to right)    |
| arm_right     | `rig_arm_right`   | swings                        |
| leg_left      | `rig_leg_left`    | swings                        |
| leg_right     | `rig_leg_right`   | swings (opposite to left)     |

Base item: `LEATHER_HORSE_ARMOR` (config `rig.base-item`). Placeholder wool-cuboid models ship now so
you can SEE the rig move; replace them with your own:

**To make the real rig models:**
1. Blockbench: model each part as its own `Java Item Model`. **Author limbs hanging DOWN from the
   model origin `[0,0,0]`** (the plugin rotates each limb about that origin, so the pivot must be the
   shoulder/hip = origin). Head/torso are centred on the origin.
2. Export each to `assets/lab/models/item/rig_<part>.json` (+ textures under `assets/lab/textures/...`).
3. Keep the `custom_model_data` ids above (they're already wired in `leather_horse_armor.json`).
4. `bash Lab/tools/build-pack.sh`. Done — `/lab rig` now shows your model.

The CCTV "body double" (Terminal) and gun reload/recoil will drive the **same rig**.

---

## C. Importing custom ANIMATIONS (walk/run/recoil/reload/etc.)

Two ways, depending on how fancy you want it:

**1. Simple, code-driven (already in the plugin):** basic walk/run swing is computed by the server in
`PlayerRig` (leg/arm sine swing scaled by speed). Recoil/reload can be added the same way — a named
clip that offsets/rotates specific parts for a few ticks. No import needed; just say which clip and
how it should move and it's added in code.

**2. Full Blockbench animations (recommended for complex clips):**
1. In Blockbench install **Animated Java** (`File → Plugins → Available`).
2. Make an **Animated Java Blueprint**, model the rig, animate on the `Animate` tab.
3. Export settings → target **Data Pack + Resource Pack**, namespace e.g. `scp`.
4. `Export` produces two things:
   - a **resource pack** (the model parts) → copy its `assets/...` into a build-pack SOURCE folder,
     then `bash Lab/tools/build-pack.sh`;
   - a **data pack** (the animation functions) → put it in the world's `datapacks/` folder on the
     server (like `Lab.zip`) and `/minecraft:reload`.
5. Animated Java generates functions like `animated_java:<rig>/animations/<clip>/play`. The plugins
   trigger a clip by running that function on the player — tell me the rig/clip names and I wire the
   triggers (e.g. reload on firing, walk on movement, the CCTV double on entering cams).

---

## Where each thing lives (summary)

| Thing                        | Goes where                                                        |
|------------------------------|-------------------------------------------------------------------|
| Item/model textures + models | a `*/resource-pack/assets/...` source → `build-pack.sh` → pack    |
| custom_model_data dispatch   | `assets/minecraft/items/<base>.json` in a pack source            |
| Combined resource pack       | auto-published to the `pack-latest` release by `build-pack.sh`    |
| Animated Java data pack      | server `world/datapacks/` + `/minecraft:reload`                   |
| Trigger logic                | the plugins (I wire clip triggers to gameplay events)            |
