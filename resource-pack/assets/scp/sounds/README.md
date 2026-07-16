# Custom sounds - drop your .ogg files here

Each entry in ../sounds.json points to an .ogg file by path. Add the files:

  gun/pistol.ogg      gun/rifle.ogg      gun/sniper.ogg
  keycard/grant.ogg   keycard/deny.ogg   keycard/swipe.ogg
  car/engine.ogg      camera/connect.ogg camera/ambient.ogg

.ogg only (Minecraft won't play .mp3/.wav). Mono, 44.1kHz is safest. Until a
file exists, that sound event is silent.

## Point the plugins at these events

- Guns (guns.yml):   `sound: scp:gun.pistol`  per gun
- Keycards (config): `sounds.grant: scp:keycard.grant` (+ deny, swipe)
- Cars (cars.yml):   `sound: scp:car.engine`  per car
- Cameras (Terminal config.yml): `cctv-sounds.connect: scp:camera.connect`
  and `cctv-sounds.ambient: scp:camera.ambient`

Then rebuild the combined pack (tools/build-pack.sh) so the .ogg files ship.
