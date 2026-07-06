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

Books + Stirring Rod + Pipette + starter atoms (machines are installed separately
with the op commands below). Then:

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
- **Every element has its own custom-model hook**: each item carries a
  `custom_model_data` string (`lab_el_h` … `lab_el_og`) and the resource pack maps
  all 118 to per-element model files under
  `assets/lab/models/item/element/`. By default they all inherit one tinted
  "atom ball" model (category colors survive via the firework tint) — replace any
  single file to give, say, uranium a bespoke look.

## Compounds — the complete list (18 recipes)

The in-game **Lab Manual** (`/function lab:give/manual`, included in the kit) lists all
of these too — and every formula in it is **clickable: click to receive exactly the
atoms you need**.

| Formula | Compound | Atoms | Effect / bonus |
|---|---|---|---|
| H2 | Hydrogen Gas | 2 H | drink: brief levitation |
| O2 | Oxygen Gas | 2 O | drink: water breathing |
| N2 | Nitrogen Gas | 2 N | not drinkable |
| H2O | Water | 2 H + O | drink: refreshing |
| H2O2 | Hydrogen Peroxide | 2 H + 2 O | drink: small heal |
| CO2 | Carbon Dioxide | C + 2 O | not drinkable |
| CO | Carbon Monoxide | C + O | not drinkable |
| CH4 | Methane | C + 4 H | not drinkable |
| NH3 | Ammonia | N + 3 H | not drinkable |
| NaCl | Salt | Na + Cl | not drinkable |
| HCl | Hydrochloric Acid | H + Cl | not drinkable |
| NaOH | Lye | Na + O + H | not drinkable |
| SO2 | Sulfur Dioxide | S + 2 O | not drinkable |
| H2SO4 | Sulfuric Acid | 2 H + S + 4 O | not drinkable |
| C2H5OH | Ethanol | 2 C + 6 H + O | not drinkable |
| C6H12O6 | Glucose | 6 C + 12 H + 6 O | drink: speed + haste, **bonus: 3 sugar** |
| Fe2O3 | Rust | 2 Fe + 3 O | not drinkable, **bonus: raw iron** |
| SiO2 | Silica | Si + 2 O | not drinkable, **bonus: 2 glass** |

Compounds come in **test tubes** (heated reactions: **boiling flasks**) — colored by
the compound, storable, rackable, centrifugable. Under the hood they are potion items,
so without the resource pack they show as bottles. The sensible ones (H2, O2, H2O,
H2O2, glucose) are drinkable; try to drink anything else and your character refuses
with a quiet *"I shouldn't drink this."* (the tooltip warns you too). The mix must
match a formula **exactly**: nothing missing, nothing extra, or it fizzles (nothing is
consumed on a fizzle). The four recipes marked *needs burner heat* additionally require
a **lit gas burner directly under the cauldron**.

## Handling rules — elements are hazardous now

Most elements are safe to handle bare-handed. The rest teach you lab safety the hard
way (each hazard is written on the item's tooltip):

- **Radioactive** (Tc, Pm, Po, At, Rn, Fr, Ra and everything from Ac to Og): wither +
  geiger clicks while *anywhere* in your inventory. An **iron chestplate** (your lead
  apron) blocks it — and fridge storage is fully shielded.
- **Toxic metals** (Hg, Pb, As, Cd, Tl, Be): **cannot be held bare-handed** — the
  sample jumps out of your hand with a poison sting. Wear the iron chestplate (PPE)
  to handle them; carrying them in your pack is fine.
- **Gases** (H, N, O, F, Cl and the noble gases): as dropped items they drift upward
  and **escape for good after ~30s** unless capped inside a cauldron (any kind) or a
  fridge.
- **Phosphorus**: smokes and **ignites within seconds in open air** — store it under
  water or in a cauldron, like a real lab does.
- **F / Cl in water**: dissolve into a lingering poison cloud.
- **Alkali metals** (Li, Na, K, Rb, Cs, Fr) in water: a violent flash that hurts
  anyone standing close — but **no TNT and no block damage**, so the facility map
  stays pristine (built for static RP maps).

### labra-plugin integration: the hazmat suit

Running [labra-plugin](https://github.com/alavesa/labra-plugin) on the server? Its
**full hazmat suit** (all four pieces, `/labra` to get one) grants **total external
immunity** to every element hazard above: radiation stops, toxic metals sit calmly in
your bare hand, halogen fumes do nothing. The datapack reads the plugin's own
`labra:hazmat` item marker straight from the items' NBT — no plugin update needed,
and the same suit rule (`all 4 slots`) applies as in the plugin's hazard zones.
Without the plugin, the iron-chestplate PPE remains the fallback. Explosions are
still explosions; hazmat is not blast armor.

## Machines — custom 3D models with real hitboxes

Built for **SCP-style RP servers**: nothing here is obtainable in survival. Staff
manage everything through the labra-plugin's `/lab` command (op / `lab.admin`,
`lab.give` defaults to op):

```
/lab place creator|burner|centrifuge|fridge|rack
/lab give kit|rod|pipette|manual|table [player]
/lab give element <player> <symbol> [count]
/lab removemachines          /lab admin
```

(The plugin dispatches the datapack's functions as you — one engine, one interface.
`/function lab:...` still exists underneath for pure-vanilla setups, but the `/lab`
command is the intended way.)

Aim at the floor; the machine installs in the spot you're looking at and **faces the
direction you're facing** (snapped to the nearest cardinal). **All machines are
mob-spawner-method custom blocks** (invisible spawner + 3D model + interaction
hitbox) and open real GUIs via [labra-plugin](https://github.com/alavesa/labra-plugin)
**v0.5.0+** — a vanilla datapack cannot open inventories, so the plugin listens for
clicks on the tagged interaction entities.

### Compound Creator — the cold reaction bench

Right-click → a **double-chest bench** (53 free slots) with a **Create Compound**
button. Lay the atoms in — e.g. **2 × Hydrogen + 1 × Oxygen** — and press the button
to commit: an exact formula match becomes the compound tube, popping out of the
machine with the brewing fizz. No match (or any non-element in the mix) and
**everything pops back out unharmed** — nothing is ever eaten by mistake. Closing
the bench without pressing the button hands your items straight back.

### Gas Burner — the hot reaction bench

Same double-chest bench and Create Compound button, but with a flame under it: the
Gas Burner makes **every** formula, including the four hot ones (H2SO4, glucose,
rust, silica) that come out in **boiling flasks**. No fuel needed — it's plumbed
into the facility gas line. The Compound Creator politely refuses hot mixes with
*"This mixture needs the Gas Burner."*

The cauldron + Stirring Rod workflow still works for cold recipes, RP flavor and
plugin-less worlds.
a spawner block for collision (the resource pack renders it invisible), an
`item_display` for the 3D model, and an `interaction` entity so **right-clicking the
machine actually does things**. Ship-with models are built from vanilla textures;
swap in your own Blockbench models — see [CUSTOM-MODEL.md](CUSTOM-MODEL.md).
**Removal is op-only** (all machines are punch-proof behind their hitboxes —
*"It's bolted down tight."*): an op toggles `/lab admin` and punches, or runs
`/lab removemachines` for everything within 5 blocks. Contents always drop.

### Centrifuge — GUI

Right-click the drum → a 9-slot **Centrifuge** feed opens. Put compound tubes in and
close it: the tubes drop into the drum and **split into their atoms** within a
second. (Dropping a tube straight onto the machine works too — no plugin needed for
that path.) Full round trip: elements → compound → elements.

### Lab Fridge — GUI

Right-click the cabinet → **27 slots of persistent cold storage** (saved per machine
by the plugin). Frost coming off it, and since stored items aren't entities or
player inventory, **radiation never escapes a fridge**. Destroying the machine drops
everything — the plugin watches the interaction entity die and empties the fridge on
the floor.

### Test Tube Rack

Lab furniture (no collision block): click it while holding
a compound tube to shelf it — **the tube appears standing in the rack**, up to six,
colors visible. Click empty-handed to take the last one back. Dismantling pops every
tube out.

### Pipette

`/function lab:give/pipette` — right-click at a cauldron to read exactly which atoms
are in the mix, or stand near a dropped compound tube to identify it.

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
