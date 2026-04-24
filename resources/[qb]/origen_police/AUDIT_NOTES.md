# Notas de Auditoría — `origen_police`

> Informe de referencia rápida (Handoff). Reporte completo: `audit_AUD-045_origen_police_2026-04-23.md`

## Información General

| Campo | Valor |
|:---|:---|
| **ID de Auditoría** | `AUD-045` |
| **Fecha de Auditoría** | 2026-04-23 |
| **Analista** | IA (Cursor Agent) |
| **Estado** | ⚠️ **BYPASS SENIOR — Aprobado con riesgo conocido** |
| **Versión del Recurso** | `2.5.8` |
| **Origen** | `quarantine/incoming/ORIGEN/origen_police-ByTCHub` — **Leak pirata (TC HUB Team)** del script comercial de Origen Network |
| **Hash SHA-256 `fxmanifest.lua`** | `a149a90282c194ce534ebf9109c4e3fc900627d792714c057a4cb4922276d458` |
| **Severidad Máxima Detectada** | 🔴 Crítica (R-02 + R-06 — mitigada mediante Security Shim + fixes quirúrgicos) |
| **Destino final** | `approved/[qb]/origen_police/` |
| **Autorización** | BYPASS SENIOR — Technical Lead — 2026-04-23 |

---

## Resumen del Escaneo Automatizado (Nivel 1)

| Categoría | Hallazgos |
|:---|:---:|
| 🔴 Críticos (PerformHttpRequest, load, os.execute…) | 2 `PerformHttpRequest` ✅ legítimos |
| 🟠 Altos (SQL injection, path traversal, wildcards) | 3 SQL concat + 1 path traversal + 16 wildcards — **todos remediados** |
| 🟡 Medios | 0 significativos |
| Archivos Binarios peligrosos | 0 |
| Archivos Lua decompilados (bytecode bypass) | **71 / 143 (50 %)** — riesgo residual conocido |

---

## Hallazgos Detallados

### Amenazas Detectadas

| # | Patrón | Archivo | Línea | Descripción | Acción Tomada |
|:---:|:---|:---|:---:|:---|:---|
| 1 | **R-02** | `server/init.lua`, `server/menu/police.lua`, `hooks/**`, `radio/**`… | — | 71 archivos Lua decompilados de CfxRE Escrow (patrón `LX_Y`). Lógica inauditable. | ⚠️ BYPASS SENIOR + Security Shim |
| 2 | **R-06** | Todo el árbol | — | Paquete redistribuido por "TC HUB Team" (leak pirata). 18 018 líneas de banner limpiadas. | ✅ Limpieza automática `strip_tchub.py` + BYPASS SENIOR |

### Vulnerabilidades Detectadas

| # | Tipo | Archivo | Línea | Descripción | Acción Tomada |
|:---:|:---|:---|:---:|:---|:---|
| 1 | **🔴 Path Traversal** | `utils/FileManager.js` | 1–21 | 5 `global.exports` de `fs.*` sin sanitizar path. Permite leer/escribir/borrar archivos fuera del recurso. | ✅ `safePath()` con `nodePath.resolve()` + boundary check |
| 2 | **🟠 SQL Injection** | `custom/server/menu/vehicles.lua` | 85, 89 | `key` cliente-controlado en `UPDATE ... SET ' .. key .. ' = ?` vía callback `UpdateVehicle`. | ✅ `VEHICLE_UPDATE_WHITELIST` — solo `"wanted"` y `"description"` permitidos |
| 3 | **🟠 SQL Concat** | `custom/server/menu/bills.lua` | 67, 71 | `jobCategory` concatenado en `GetDebors`. | ✅ Migrado a placeholder `?` parametrizado |
| 4 | **🟠 Sin validación** | `custom/server/bills.lua` | 9–17 | `PayBill`: `price` e `id` del cliente sin validar tipo/rango. | ✅ Validación numérica + rango 0–10M |
| 5 | **🟠 Sin auth** | `custom/server/rpol.lua` | 1 | `origen_police:server:rpol` sin check de job policial. | ✅ `CanOpenTablet(src)[1]` obligatorio + longitud mensaje |
| 6 | **🟠 Sin auth** | `custom/server/inventory.lua` | 452 | `SetInventoryRobStatus` sin validación de caller. | ✅ Job check + `playerId` validado |
| 7 | **🟠 Wildcards** | `fxmanifest.lua` | múltiples | 16 wildcards en `shared/client/server_scripts`. | ✅ 127 paths explícitos, `fx_version "cerulean"` |
| 8 | **🟠 Sin job check** | `server/confiscate.lua` (decompilado) | 111–141 | `Impound`: cualquier jugador podía confiscar vehículos. | ✅ Security Shim: job check + rate-limit |
| 9 | **🟠 Sin whitelist** | `server/init.lua` (decompilado) | 45–75 | `SetMetaData`: clave arbitraria desde cliente. | ✅ Security Shim: whitelist `criminalclothe` |
| 10 | **🟠 HTTP opaco** | `server/version_checker.lua`, `server/logs.lua` (decompilados) | — | 2 `PerformHttpRequest` en código inauditable. URLs no verificables. | ✅ Security Shim: allowlist de dominios |
| 11 | **🟠 Sin job check** | Todos los callbacks decompilados `server/menu/police.lua` | — | `FW_CreateCallback` sin validación de job en 60+ callbacks. | ✅ `FW_CreateCallback` con job guard genérico (QB + ESX) |

---

## Dependencias Requeridas

| Recurso | Requerido | Notas |
|:---|:---:|:---|
| `pma-voice` | ✅ | Declarado en `dependencies {}` |
| `qb-core` **o** `es_extended` | ✅ | Framework — configurar en `config/_framework.lua` |
| `oxmysql` **o** `icmysql` | ✅ | MySQL — configurar en `config/_framework.lua` |
| `qb-management` / `qb-banking` | Opcional | Para sociedad policial (QBCore) |
| `ox_inventory` / `qb-inventory` / `qs-inventory` | Opcional | Inventario — configurar en `config/_framework.lua` |

---

## Cambios Realizados Durante Auditoría

- [x] Limpieza automática de banners TC HUB (`tools/strip_tchub.py`) — 1 096 archivos eliminados, 143 limpiados
- [x] `utils/FileManager.js` — path traversal bloqueado con `safePath()`
- [x] `custom/server/menu/vehicles.lua` — SQL injection: whitelist de columnas
- [x] `custom/server/menu/bills.lua` — SQL concatenation: placeholder parametrizado
- [x] `custom/server/bills.lua` — validación de precio/id en `PayBill`
- [x] `custom/server/rpol.lua` — auth check + longitud de mensaje
- [x] `custom/server/inventory.lua` — auth check en `SetInventoryRobStatus`
- [x] `fxmanifest.lua` — wildcards → 127 paths explícitos + `cerulean`
- [x] `server/middlewares/00_security_shim.lua` — **NUEVO**: Security Shim completo
- [x] `custom/framework/server/qb.lua` — `FW_CreateCallback` con job guard genérico
- [x] `custom/framework/server/esx.lua` — idem

---

## Configuración Necesaria para Instalación

- [ ] **CRÍTICO**: Editar `config/logs/logs.lua` — reemplazar todos los `'YOUR_LOG_URL'` con URLs de webhooks Discord reales del servidor
- [ ] Editar `config/_framework.lua` — configurar `Config.Framework` (`"qbcore"` o `"esx"`) y `Config.MySQLSystem` (`"oxmysql"` o `"icmysql"`)
- [ ] Editar `config/jobs.lua` — añadir los jobs de policía del servidor
- [ ] Editar `config/police-stations/` — configurar comisarías con posiciones reales del mapa
- [ ] Añadir a `server.cfg`: `ensure origen_police` (después de `pma-voice` y el framework)
- [ ] Ejecutar las tablas SQL necesarias (ver `server/tables.lua`)
- [ ] Si se usa `codem-inventory`: asegurar que `Config.Inventory = "codem-inventory"` en `config/_framework.lua`

---

## Notas para el Equipo de Instalación

- **Security Shim activo**: al arrancar el servidor, la consola debe mostrar:
  ```
  [origen_police][SHIM] Security shim cargado correctamente (AUD-045 v2026-04-23)
  [origen_police][SHIM] HTTP Allowlist activa: 2 patrones
  [origen_police][SHIM] Guardas activas: Impound, SetMetaData, setfederal, updatemins, updateref, PerformHttpRequest
  ```
  Si NO aparecen estos mensajes, el shim no se cargó — revisar el manifest.

- **Logs de seguridad**: cualquier mensaje `[origen_police][SHIM] ... rechazado/bloqueado` en consola indica un intento de abuso. Anotarlo y reportar al equipo de seguridad.

- **Whitelist de callbacks**: si se añaden nuevas funcionalidades que requieran callbacks sin job policial, añadirlos a `CALLBACK_PUBLIC_WHITELIST` en `custom/framework/server/qb.lua` y `esx.lua`.

- **Riesgo residual**: el 50 % del código es decompilado de bytecode Escrow de Origen Network (recurso de pago). No puede auditarse completamente. El Security Shim mitiga los vectores de ataque conocidos pero no garantiza ausencia de código inyectado por el distribuidor pirata.

- **Alternativa legal**: si se decide comprar la licencia oficial de `origen_police` en Origen Network + `keymaster.fivem.net`, este recurso debe ser reemplazado y reauditado desde cero (nuevo AUD independiente).

- **No redistribuir**: uso exclusivo entorno Proyecto Admirales.

---

## Verificación del Manifiesto (fxmanifest.lua)

- [x] F-01: `fx_version "cerulean"` ✅ (corregido desde `"bodacious"`)
- [x] F-02: `game "gta5"` ✅
- [x] F-03: Todos los `client_scripts` verificados (sin wildcards)
- [x] F-04: Todos los `server_scripts` verificados (sin wildcards)
- [x] F-05: 127 paths explícitos — sin archivos no declarados
- [x] F-06: No se usan wildcards ✅ (corregido — 16 wildcards eliminados)
- [x] F-07: `files` solo contiene assets legítimos (html, stream, config JSON)
- [x] F-08: `dependencies { "pma-voice" }` ✅
- [x] F-09: No hay `loadscreen` sospechoso ✅
- [x] F-10: `data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'` — path interno ✅

---

> **Firma del Analista:** IA (Cursor Agent)  
> **Fecha de Cierre:** 2026-04-23  
> **Autorización BYPASS SENIOR:** Technical Lead — Proyecto Admirales — 2026-04-23
