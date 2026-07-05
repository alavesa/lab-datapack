# Lab — datapack

[![Reviewed by PatchPilots](https://img.shields.io/badge/Reviewed%20by-PatchPilots-8A2BE2)](https://github.com/alavesa/patchpilots)

Chemistry for Minecraft as a pure vanilla datapack: all **118 elements**, a clickable
**periodic table book**, **compound synthesis** in a cauldron, **centrifuges** that split
compounds back apart, **lab fridges** for storage and an **experiments** advancement tree.
No plugins, no resource pack — companion to
[labra-plugin](https://github.com/alavesa/labra-plugin).

> **History:** this repo started as `pneumatic-tube-datapack` (old links redirect here).
> The pneumatic tube module lived in [v0.2](../../releases/tag/v0.2) and was replaced by
> chemistry in v0.3 — grab v0.2 if you want the tubes.

## Install

1. Drop the `Lab` folder into `<world>/datapacks/` and `/reload`.
   Requires 1.21.5+ (pack_format 88). Commands need op / cheats.
2. *(Recommended)* Add `LabResourcePack.zip` to `.minecraft/resourcepacks/` — it makes
   the machine spawner-blocks invisible so the 3D machine models stand alone. Without
   it, machines show as a spawner cage with the base item inside (fully functional,
   just less pretty).

**Upgrading from v0.2 (tubes)?** Run the old `/function pneumatic:uninstall` *before*
updating, so tube markers and scoreboards get cleaned up.

## Quick start

```
/function lab:give/kit
```

Book + Stirring Rod + starter atoms. Then:

1. Place a **cauldron**. Keep it **dry** — water is for accidents.
2. Toss in `2 × Hydrogen` and `1 × Oxygen` (click symbols in the book to get more).
3. Look at the cauldron and **right-click the Stirring Rod** → bubbling, and a **Water**
   vial pops out. That's your first experiment done.

## Elements

- Every element is a color-coded item (firework star — the explosion color tints the
  sprite, so categories get colors with **zero resource pack**): red alkali metals,
  yellow transition metals, aqua nonmetals, blue noble gases…
- Get them from the **Periodic Table book** (`/function lab:give/table`) — 118 clickable
  symbols with hover info — or directly: `/function lab:e {s:"Na"}`.
- Elements don't stack (1 item = 1 atom). That's what makes recipe counting honest.

## Compounds (18 recipes)

Throw the exact atoms into a dry cauldron and stir:

| Formula | Compound | Drinking it… |
|---|---|---|
| H2, O2, N2 | diatomic gases | H2 lifts you off the ground, O2 = water breathing |
| H2O | Water | is refreshing but uneventful |
| H2O2 | Hydrogen Peroxide | heals a bit (antiseptic!) |
| CO2 / CO | Carbon Di-/Monoxide | slows you / poisons you |
| CH4 | Methane | nauseates |
| NH3 | Ammonia | blinds (pungent!) |
| NaCl | Salt | makes you hungry |
| HCl, H2SO4 | acids | hurts. It's acid. |
| NaOH | Lye | also hurts |
| SO2 | Sulfur Dioxide | poisons |
| C2H5OH | Ethanol | nausea, obviously |
| C6H12O6 | Glucose | speed + haste, **bonus: 3 sugar** |
| Fe2O3 | Rust | **bonus: raw iron** |
| SiO2 | Silica | **bonus: 2 glass** |

Compounds are colored vials (potion items) — drinkable, storable, centrifugable.
The mix must match a formula **exactly**: nothing missing, nothing extra, or it fizzles
(nothing is consumed on a fizzle).

## Machines — custom 3D models with real hitboxes

Machines are placed with a look-raycast (`/function lab:place/centrifuge`,
`/function lab:place/fridge` — aim at the floor) and built the **mob-spawner way**:
a spawner block for collision (the resource pack renders it invisible), an
`item_display` for the 3D model, and an `interaction` entity so **right-clicking the
machine actually does things**. Ship-with models are built from vanilla textures;
swap in your own Blockbench models — see [CUSTOM-MODEL.md](CUSTOM-MODEL.md).
Mine the spawner or run `/function lab:remove` nearby to remove a machine cleanly.

### Centrifuge

Drop a compound vial onto the machine and **right-click** → it spins the vial apart
into its element items. Full round trip: elements → compound → elements.

### Lab Fridge

A tall white cabinet with frost coming off it:

- drop chemicals next to it and **right-click** → it vacuums every element and vial
  within 2 blocks into internal cold storage (actionbar shows the count)
- **sneak + right-click** → it pops everything back out
- mine it (or `/function lab:remove`) and it dumps its contents first — nothing is
  ever lost. Contents live in `storage lab:fridges`, one list per fridge id.

## Experiments

A real advancement tab ("Lab") with 9 experiments, granted as you do science:

- **Baby's First Compound** — stir any successful reaction
- **Two Parts Hydrogen** — synthesize water
- **Sugar Rush** — synthesize glucose (24 atoms!)
- **Handle With Care** — make an acid
- **Chemist** — complete 10 reactions
- **Never Trust Sodium** — drop an alkali metal into water. Yes, any of the six. Yes,
  it does what you think it does. Stand back.
- **Spin Cycle** — centrifuge a compound
- **Cold Storage** — install a Lab Fridge

## How it works (nerd corner)

- The element registry is a `data storage` compound; the book's click events call
  `lab:e {s:"…"}`, which forwards the whole registry entry to a give-macro with
  `function … with storage`. One macro function serves all 118 elements.
- Reaction matching counts item entities inside the cauldron block per symbol
  (`execute store result … if entity`), plus a total over all elements — exact-match
  semantics make the 18 recipes mutually exclusive, so a stray gold atom in the mix
  correctly blocks every recipe.
- Stirring Rod = `used:carrot_on_a_stick` scoreboard criterion (the Flashlights trick),
  raycast to the cauldron (the Keycards trick).

## Notes / known rough edges

- The alkali-water TNT has a real blast. That is a feature, but maybe not indoors.
- The resource pack's invisible-spawner override affects **every spawner in the
  world** (dungeons included — they still work, you just see no cage). That's the
  known cost of the mob-spawner custom-block method.
- Machine models don't auto-rotate toward the player; the shipped models are designed
  to read well from all sides.
- `advancement grant` drives the experiments, so they also show for players in
  spectator who happen to be nearest to a sodium splash — cosmetic quirk.
- `/function lab:uninstall` retires machines (fridges dump contents), removes
  scoreboards and registries; element and vial items already in chests stay behind as
  ordinary (harmless) items.
