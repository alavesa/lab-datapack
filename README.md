# Pneumatic Tubes — datapack

[![Reviewed by PatchPilots](https://img.shields.io/badge/Reviewed%20by-PatchPilots-8A2BE2)](https://github.com/alavesa/patchpilots)

Pneumatic mail tubes for Minecraft — drop items into a station barrel and a capsule
whooshes them through glass tubing to the station at the other end. No hoppers, no
redstone, no plugins. Built for facility / SCP-style servers, and idea **#174 / #690**
from [minecraft-500-ideas](https://github.com/alavesa/minecraft-500-ideas).

Everything is vanilla: stations are named barrels, tubes are ordinary glass (or copper
grates), and the travelling capsule is a single `item_display` showing the actual stack
gliding through the tube.

## Install

Drop the `PneumaticTubes` folder into `<world>/datapacks/` and `/reload`.
Requires 1.21.5+ (pack_format 88).

## Quick start

1. `/function pneumatic:give/station` — gives a **Pneumatic Station** barrel. Place two
   of them. Each one registers itself the moment you place it (green sparkles + chime).
2. Connect the two barrels with a line of **glass blocks** — any face of the barrel,
   corners and vertical runs are fine.
3. Drop items into either barrel. Every ~0.4s the station launches the first stack as a
   capsule that travels the tube (~10 blocks/s) and pops out at the other station.

No addressing, no channels: **the tube is the address.** One tube, two ends, done.

## Tube blocks

Anything in the `#pneumatic:tube` block tag counts as tubing:

- `glass` and all 16 stained glass colors (color-code your wings!)
- `tinted_glass` — for "opaque" utility-corridor pipes
- all copper grates (waxed and unwaxed) — industrial look, see-through

Edit `data/pneumatic/tags/block/tube.json` to add your own.

## Routing rules

Simple and deterministic — no pathfinding:

- The capsule **prefers to keep going straight**; at a bend it takes the first available
  branch in a fixed order (up, down, north, south, west, east). It never reverses.
- The trip ends at the **first station barrel the capsule steps into**. A station on the
  *side* of a through-line is passed by if the tube continues straight — so a straight
  trunk line past a wing's station works the way you'd hope.
- Dead end, broken tube or 512 blocks travelled → the capsule pops its payload right
  there (fizzle sound + smoke). **Items are never deleted.**
- Junctions are legal but deterministic, not smart. For predictable mail, build
  point-to-point tubes: one tube, two stations.

## Stations

- A station is any placed barrel named **Pneumatic Station** — the give-item works out
  of the box, an anvil-renamed barrel works too.
- Placement is auto-detected (advancement + a short raycast, same trick as
  [keycard-datapack](https://github.com/alavesa/keycard-datapack) readers). If a station
  ever fails to register, look at it and run `/function pneumatic:register`.
- Arriving items pop out just above the receiving barrel with a dispense sound.
- Breaking the barrel retires the station automatically (checked every 2s).
- Misfeature-free removal: `/function pneumatic:uninstall` lands all in-flight capsules
  and cleans up every marker and scoreboard.

## How it works (nerd corner)

- The capsule is **one** `item_display`: its `item` field *is* the payload (full stack,
  count included), `teleport_duration:2` makes the 1-block-per-2-ticks teleports render
  as continuous motion.
- Movement gating uses a scratch fake player (`#moved pn.var`) instead of a score on the
  capsule — arrival kills the entity mid-function chain, and dead-entity score checks
  fail silently rather than gate.
- Station detection matches `CustomName` both as a text-component compound (the give
  item) and as a plain string (anvil renames), so both survive 1.21.5+ NBT changes.

## Notes / known rough edges

- Arriving items are **dropped above** the barrel, not inserted into it (vanilla has no
  clean "insert into container" for dynamic stacks). Put a hopper feeding a chest under
  the landing spot if you want automatic collection.
- One stack per capsule, one capsule per station mouth at a time — a full barrel drains
  stack by stack. That's the pneumatic-mail aesthetic, not a bug.
- A tube loop can bring a capsule back to its own station. It will happily deliver to
  itself. Don't build loops.
