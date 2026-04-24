-- =====================================================
-- =====================================================


fx_version "cerulean"
game "gta5"
lua54 "yes"

version 'v1.6.5'
author "JG Scripts  | Said Ak"

dependencies {
  "oxmysql",
  "ox_lib",
  "jg-vehiclemileage",
  "/server:7290",
  "/onesync",
}

shared_scripts {
  "@ox_lib/init.lua",
  "config/config-sv.lua",
  "config/config.lua",
  "config/config.mods.lua",
  "config/config.servicing.lua",
  "config/config.tuning.lua",
  "locales/ar.lua",
  "locales/cn.lua",
  "locales/de.lua",
  "locales/en.lua",
  "locales/es.lua",
  "locales/fr.lua",
  "locales/hu.lua",
  "locales/it.lua",
  "locales/ja.lua",
  "locales/pt.lua",
  "locales/sv.lua",
  "locales/zh-tw.lua",
  "shared/constants.lua",
  "shared/main.lua",
  "framework/main.lua"
}

client_scripts {
  "framework/cl-functions.lua",
  "framework/esx/cl-esx.lua",
  "framework/qb/cl-qb.lua",
  "framework/qbx/cl-qbx.lua",
  "client/cl-admin.lua",
  "client/cl-cameras.lua",
  "client/cl-carlift.lua",
  "client/cl-dyno.lua",
  "client/cl-employees.lua",
  "client/cl-fixing.lua",
  "client/cl-handling.lua",
  "client/cl-invoice.lua",
  "client/cl-lightcontroller.lua",
  "client/cl-locations.lua",
  "client/cl-main.lua",
  "client/cl-management.lua",
  "client/cl-minigames.lua",
  "client/cl-mods.lua",
  "client/cl-nitrous.lua",
  "client/cl-orders.lua",
  "client/cl-servicing.lua",
  "client/cl-shops-stashes.lua",
  "client/cl-stancer.lua",
  "client/cl-tablet.lua",
  "client/cl-tuning.lua",
  "client/cl-vehicleprops.lua"
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  "framework/sv-functions.lua",
  "framework/esx/sv-esx.lua",
  "framework/esx/cl-esx.lua",
  "framework/qb/cl-qb.lua",
  "framework/qbx/cl-qbx.lua",
  "server/sv-admin.lua",
  "server/sv-carlift.lua",
  "server/sv-dyno.lua",
  "server/sv-employees.lua",
  "server/sv-fixing.lua",
  "server/sv-initsql.lua",
  "server/sv-invoice.lua",
  "server/sv-locations.lua",
  "server/sv-main.lua",
  "server/sv-management.lua",
  "server/sv-mods.lua",
  "server/sv-nitrous.lua",
  "server/sv-orders.lua",
  "server/sv-servicing.lua",
  "server/sv-shops-stashes.lua",
  "server/sv-tablet.lua",
  "server/sv-tuning.lua",
  "server/sv-usable-items.lua",
  "server/sv-vehicleprops.lua",
  "server/sv-version-check.lua",
  "server/sv-webhooks.lua"
}

ui_page "web/dist/index.html"

files {
  "stream/vehicle_paint_ramps.ytd",
  "web/dist/index.html",
  "web/dist/assets/index-C2kgfbjq.js",
  "web/dist/assets/index-CPa4RSeI.css",
  "web/dist/bike-servicing.png",
  "web/dist/default-wallpaper.jpg",
  "web/dist/icons/armour.svg",
  "web/dist/icons/bonnet.svg",
  "web/dist/icons/brakes.svg",
  "web/dist/icons/bumper.svg",
  "web/dist/icons/cabin.svg",
  "web/dist/icons/car-door.svg",
  "web/dist/icons/car-seat.svg",
  "web/dist/icons/car-side.svg",
  "web/dist/icons/cosmetics.svg",
  "web/dist/icons/dashboard.svg",
  "web/dist/icons/drivetrain.svg",
  "web/dist/icons/engine.svg",
  "web/dist/icons/exhaust.svg",
  "web/dist/icons/extras.svg",
  "web/dist/icons/fender.svg",
  "web/dist/icons/gear-stick.svg",
  "web/dist/icons/headlight.svg",
  "web/dist/icons/horn.svg",
  "web/dist/icons/hydraulic.svg",
  "web/dist/icons/license-plate.svg",
  "web/dist/icons/neon.svg",
  "web/dist/icons/perf.svg",
  "web/dist/icons/repair.svg",
  "web/dist/icons/respray.svg",
  "web/dist/icons/roof.svg",
  "web/dist/icons/side-mirror.svg",
  "web/dist/icons/sparkling.svg",
  "web/dist/icons/spoiler.svg",
  "web/dist/icons/stance.svg",
  "web/dist/icons/steering.svg",
  "web/dist/icons/subwoofer.svg",
  "web/dist/icons/sunglasses.svg",
  "web/dist/icons/suspension.svg",
  "web/dist/icons/transmission.svg",
  "web/dist/icons/trunk.svg",
  "web/dist/icons/turbo.svg",
  "web/dist/icons/tyres.svg",
  "web/dist/icons/wheels/bespoke.svg",
  "web/dist/icons/wheels/bike.svg",
  "web/dist/icons/wheels/highend.svg",
  "web/dist/icons/wheels/lowrider.svg",
  "web/dist/icons/wheels/muscle.svg",
  "web/dist/icons/wheels/offroad.svg",
  "web/dist/icons/wheels/openwheel.svg",
  "web/dist/icons/wheels/originals.svg",
  "web/dist/icons/wheels/sport.svg",
  "web/dist/icons/wheels/street.svg",
  "web/dist/icons/wheels/suv.svg",
  "web/dist/icons/wheels/track.svg",
  "web/dist/icons/wheels/tuner.svg",
  "web/dist/icons/window.svg",
  "web/dist/ifruit-air.png",
  "web/dist/jg-rugged.png",
  "web/dist/lighting-controller.png",
  "web/dist/loading.gif",
  "web/dist/vehicle-servicing.png",
  "web/dist/wallpaper.jpg",
  "logos/bennys.png",
  "logos/ls_customs.png",
  "data/carcols_gen9.meta",
  "data/carmodcols_gen9.meta",
  "audiodirectory/jg_mechanic.awc",
  "audiodirectory/jg_mechanic.awc.xml",
  "audiodirectory/jg_mechanic/hydraulic_left.wav",
  "audiodirectory/jg_mechanic/repair_left.wav",
  "data/audioexample_sounds.dat54.rel.xml",
  "data/jg_mechanic_sounds.dat54.rel"
}

data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file "AUDIO_WAVEPACK" "audiodirectory"
data_file "AUDIO_SOUNDDATA" "data/jg_mechanic_sounds.dat"
