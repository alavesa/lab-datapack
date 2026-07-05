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

Drop the `Lab` folder into `<world>/datapacks/` and `/reload`.
Requires 1.21.5+ (pack_format 88). Commands need op / cheats.

**Upgrading from v0.2 (tubes)?** Run the old `/function pneumatic:uninstall` *before*
updating, so tube markers and scoreboards get cleaned up.

## Quick start

```
/function lab:give/kit
```

Book + Stirring Rod + fridge + starter atoms. Then:

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

## Centrifuge

**Any grindstone is a centrifuge.** Drop a compound vial on top → within a second it
spins up and splits the compound back into its element items. Full round trip:
elements → compound → elements.

## Lab Fridge

`/function lab:give/fridge` — a named barrel that registers itself when placed (same
raycast trick as [keycard-datapack](https://github.com/alavesa/keycard-datapack)
readers), hums with frost particles and stores your vial collection. Break it and it
retires cleanly. Fallback registration: look at it and run `/function lab:register`.

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
- **Cold Storage** — set up a Lab Fridge

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

- Recipes assume the cauldron sits where items can rest **inside** it — don't put a
  hopper under the cauldron block, hoppers don't steal from cauldrons but the capsule
  spawn point is just above the rim.
- The alkali-water TNT has a real blast. That is a feature, but maybe not indoors.
- `advancement grant` drives the experiments, so they also show for players in
  spectator who happen to be nearest to a sodium splash — cosmetic quirk.
- `/function lab:uninstall` removes markers, scoreboards and the registry; element and
  vial items already in chests stay behind as ordinary (harmless) items.
