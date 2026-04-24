# Scripts instalados - Control de subida

Documento operativo para no perder trazabilidad de instalaciones en el servidor FiveM QBCore.

## Estado actual del repositorio

- Rama: `main` (trackea `origin/main`).
- Estado: hay cambios locales sin commit y scripts nuevos sin versionar.
- Conclusión: **no todo esta subido** ahora mismo.

## Orden cronologico (basado en historial + server.cfg)

> Convencion de estado:
> - `SUBIDO`: ya existe en remoto mediante commit.
> - `PENDIENTE`: existe local pero falta commit/push.
> - `REEMPLAZADO`: script desactivado/sustituido.

### 2026-04-16

- `0r-multicharacterv3` - `SUBIDO` - instalacion inicial y fixes.
- `ox_lib` - `SUBIDO` - agregado con bootstrap inicial.
- `nc-spawnselector` - `SUBIDO` - integrado con flujo spawn.

### 2026-04-17

- `ad-appearance` (antes `qb-clothing`) - `SUBIDO` - refactor UI y rename de recurso.
- `0r-hud-v3` - `SUBIDO` - HUD principal.
- `xsound` - `SUBIDO` - dependencia de HUD/audio.
- `JustNotify` - `SUBIDO` - sistema de notificaciones.
- `prism_banking` - `SUBIDO` - banco/economia.
- `0r-chat` - `SUBIDO` - chat integrado.
- `17mov_CharacterSystem` - `SUBIDO` - bloque de personaje.

### 2026-04-20

- `lc_fuel` - `SUBIDO` - reemplazo de `qb-fuel`.
- `lc_utils` - `SUBIDO` - dependencia ecosistema lc.
- `lc_gas_stations` - `SUBIDO` - estaciones de combustible.
- `lc_stores` - `SUBIDO` - tiendas del ecosistema lc.

### 2026-04-22 / 2026-04-24 (detectado en server.cfg + estado git)

- `lation_ui` - `SUBIDO` - script standalone UI (commit/push realizado en este ciclo).
- `mWeed` - `SUBIDO` - script de cultivo (categoria `[qb]`) (commit/push realizado en este ciclo).
- `codem-craftv2` - `SUBIDO` - crafting (commit/push realizado en este ciclo).
- `luxu_admin` - `SUBIDO` - panel admin premium (commit/push realizado en este ciclo).
- `origen_police` - `SUBIDO` - reemplazo de policejob (commit/push realizado en este ciclo).
- `jg-mechanic-props` - `PENDIENTE` - **PACK JG Mechanic** (dependencia visual).
- `jg-vehiclemileage` - `PENDIENTE` - **PACK JG Mechanic** (dependencia funcional).
- `jg-mechanic` - `PENDIENTE` - **PACK JG Mechanic** (principal).
- `3fe_woodbox` - `PENDIENTE` - parte de pack ilegal.
- `0r-illegalpack` - `PENDIENTE` - pack ilegal principal.
- `cfx-nteam-paletomechanic` - `PENDIENTE` - mapa/defaultmap.
- `sc_c_island` - `PENDIENTE` - mapa/defaultmap.

### Reemplazos / retiros detectados

- `qb-adminmenu` - `REEMPLAZADO` por `luxu_admin`.
- `qb-policejob` - `REEMPLAZADO` por `origen_police` (archivos marcados como borrados en git).
- `qb-shops` - `REEMPLAZADO/RETIRADO` (archivos marcados como borrados en git).
- `qb-inventory` - `REEMPLAZADO` por `codem-inventory`.
- `qb-fuel` - `REEMPLAZADO` por `lc_fuel`.

## Plan operativo script por script

1. Verificar integridad del script local (`fxmanifest.lua`, dependencias, sql, assets).
2. Verificar activacion (`ensure` en `server.cfg` y orden de carga).
3. Revisar cambios git del script (nuevos/modificados/borrados).
4. Commit dedicado por modulo (`feat:`, `fix:`, `chore:`) sin mezclar.
5. Push inmediato tras cada commit.
6. Registrar resultado aqui en este archivo y en `COMMANDS_SCRIPTS.md` si aplica.

## Cola de trabajo sugerida (cronologica)

1. `jg-mechanic-props` + `jg-vehiclemileage` + `jg-mechanic` (como pack)
2. `3fe_woodbox` + `0r-illegalpack` (pack)
3. `cfx-nteam-paletomechanic`
4. `sc_c_island`
