# JG Mechanic — Guía de Testing E2E Completa
> **Pack**: jg-mechanic v1.6.5 · **Ref. auditoría**: AUD-046 (BYPASS SENIOR) · **INST**: INST-XXX · Fecha: 2026-04-24

---

## ÍNDICE
1. [Pre-requisitos: verificar stack antes de entrar al juego](#1-pre-requisitos-verificar-stack-antes-de-entrar-al-juego)
2. [Fase 0: Arranque limpio del servidor](#2-fase-0-arranque-limpio-del-servidor)
3. [Fase 1: Verificación de base de datos](#3-fase-1-verificación-de-base-de-datos)
4. [Fase 2: Verificación in-game como Admin (sin job)](#4-fase-2-verificación-in-game-como-admin-sin-job)
5. [Fase 3: Configuración del Job de Mecánico](#5-fase-3-configuración-del-job-de-mecánico)
6. [Fase 4: Testing como Mecánico empleado](#6-fase-4-testing-como-mecánico-empleado)
7. [Fase 5: Testing como Dueño de taller (Boss)](#7-fase-5-testing-como-dueño-de-taller-boss)
8. [Fase 6: Testing como Cliente (civiles)](#8-fase-6-testing-como-cliente-civiles)
9. [Fase 7: Bennys (Self-Service)](#9-fase-7-bennys-self-service)
10. [Fase 8: Performance y Resmon](#10-fase-8-performance-y-resmon)
11. [Referencia de comandos y cheats de admin](#11-referencia-de-comandos-y-cheats-de-admin)
12. [Tabla de errores conocidos y sus fixes](#12-tabla-de-errores-conocidos-y-sus-fixes)

---

## 1. Pre-requisitos: verificar stack antes de entrar al juego

### Integrations configuradas en `config.lua`

| Config key | Valor actual | Script instalado | Estado |
|---|---|---|---|
| `Config.Framework` | `"QBCore"` | qb-core v1.3.0 | ✅ |
| `Config.Inventory` | `"codem-inventory"` | codem-inventory en `[qb]` | ✅ |
| `Config.Notifications` | `"ox_lib"` | ox_lib en `[standalone]` | ✅ |
| `Config.ProgressBar` | `"ox-bar"` | ox_lib (lib.progressBar) | ✅ |
| `Config.SkillCheck` | `"ox"` | ox_lib (lib.skillCheck) | ✅ |
| `Config.DrawText` | `"ox_lib"` | ox_lib | ✅ |
| `Config.Menus` | `"lation_ui"` | lation_ui en `[standalone]` | ✅ |
| `Config.SocietyBanking` | `"qb-management"` | qb-management en `[qb]` | ✅ |
| `Config.Target` | `"qb-target"` | qb-target en `[qb]` | ✅ |
| `Config.Locale` | `"es"` / `"es-ES"` / `"EUR"` | Localización española | ✅ |

### Dependencias del fxmanifest
```
oxmysql       → ensure oxmysql (antes que todo)
ox_lib        → ensure ox_lib (antes que jg-mechanic)
jg-vehiclemileage → ensure jg-vehiclemileage (antes que jg-mechanic)
/server:7290  → sv_enforceGameBuild 3095 activo
/onesync      → OneSync activo en servidor
```

### Tablas DB requeridas
```sql
mechanic_data            → datos del taller (nombre, balance, owner)
mechanic_employees       → empleados del taller
mechanic_orders          → pedidos de piezas
mechanic_invoices        → facturas emitidas
mechanic_servicing_history → historial de servicios
mechanic_settings        → preferencias por jugador
mechanic_vehicledata     → datos persistentes del vehículo
player_vehicles.mileage  → columna añadida por jg-vehiclemileage
```

---

## 2. Fase 0: Arranque limpio del servidor

### 2.1 Desde txAdmin
```
1. Menú "Resources" → jg-mechanic → Restart
2. Observar consola: NO debe aparecer ningún SCRIPT ERROR
```

### 2.2 Logs esperados en consola al arrancar (OK)
```
[  script:jg-mechanic]  jg-mechanic started successfully
[  script:oxmysql]      jg-vehiclemileage: ALTER TABLE player_vehicles ... (solo primera vez)
```

### 2.3 Logs que indican error (investigar antes de continuar)
```
SCRIPT ERROR: @jg-mechanic/...   → error de código, consultar Fase 12
[SQL ERROR] There was an error   → error de SQL, verificar Fase 1
No such export ... from ...      → dependencia no arrancada
depends on ... not started       → revisar orden de ensure en server.cfg
```

---

## 3. Fase 1: Verificación de base de datos

### 3.1 Verificar tablas en HeidiSQL / phpMyAdmin
```sql
-- Comprobar que existen las 7 tablas
SHOW TABLES LIKE 'mechanic%';

-- Resultado esperado:
-- mechanic_data
-- mechanic_employees
-- mechanic_orders
-- mechanic_invoices
-- mechanic_servicing_history
-- mechanic_settings
-- mechanic_vehicledata
```

### 3.2 Verificar columna mileage en player_vehicles
```sql
SHOW COLUMNS FROM player_vehicles LIKE 'mileage';
-- Debe mostrar: mileage | float | NO | | 0 |
```

### 3.3 Verificar que los talleres se inicializaron
```sql
SELECT * FROM mechanic_data;
-- Debe tener filas: bennys, lscustoms (insertadas al iniciar el recurso)
```

### 3.4 Si las tablas NO existen — ejecutar SQL manual
```sql
-- Copiar y ejecutar: jg-mechanic/install/database/run.sql
-- Asegurarse de estar en la base de datos correcta (admirales)
```

### 3.5 Si la columna mileage no existe
```sql
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `mileage` FLOAT DEFAULT 0 NOT NULL;
```

---

## 4. Fase 2: Verificación in-game como Admin (sin job)

### 4.1 Conectar al servidor como admin
- Entrar con personaje admin (grupo `group.admin` en server.cfg)
- Abrir consola F8: `resmon 1` para monitorear rendimiento

### 4.2 Verificar blips en el mapa
- [ ] Blip de **Bennys** (Self-Service) → coords `(-211.6, -1324.73, 30.23)`
- [ ] Blip de **LS Customs** (taller owned) → coords `(-337.25, -137.2, 38.35)`

### 4.3 Verificar zonas de interacción con qb-target
- [ ] Acercar vehículo a zona de Bennys → aparece prompt de qb-target con opciones
- [ ] Acercar a zona de LS Customs → prompt de cliente visible
- [ ] Zona de empleados en LS Customs (coords `-324.2, -132.0, 38.54`) → solo empleados

### 4.4 Comando de admin básico
```
/vfix          → reparar vehículo actual al 100%
/mechanicadmin → abrir panel de administración de taller
```

### 4.5 Verificar inventario de items (codem-inventory)
```
/give [id] engine_oil 5       → dar aceite de motor al jugador
/give [id] mechanic_tablet 1  → dar tablet de mecánico
```
Verificar que los items aparecen en el inventario con imagen correcta.

---

## 5. Fase 3: Configuración del Job de Mecánico

### 5.1 Verificar job en qb-core (shared/jobs.lua)
El job `mechanic` debe existir con grades 0-4 mínimo.
```lua
-- Buscar en: resources/[qb]/qb-core/shared/jobs.lua
mechanic = {
    label = 'Mecánico',
    grades = {
        ['0'] = { name = 'Aprendiz', payment = 50 },
        ['1'] = { name = 'Mecánico', payment = 100 },
        ['2'] = { name = 'Mecánico Senior', payment = 150 },
        ['3'] = { name = 'Encargado', payment = 200 },
        ['4'] = { name = 'Jefe', payment = 300 },
    }
}
```
> Si no existe, añadirlo. El config de jg-mechanic usa `job = "mechanic"` y `jobManagementRanks = {4}`.

### 5.2 Dar job mechanic (grade 4 = Boss) a un jugador de prueba
```
/setjob [id] mechanic 4       → asignar job mechanic, grade 4 (boss)
```

### 5.3 Configurar cuenta de sociedad en qb-management
Verificar que `qb-management/config.lua` tiene la cuenta `mechanic`:
```lua
-- En qb-management/config.lua debe existir:
mechanic = {
    vector3(-347.59, -133.35, 39.01),   -- zona del boss menu
}
```
Abrir el boss menu en esas coordenadas para verificar que funciona.

### 5.4 Dar fondos iniciales al taller (opcional para test)
Mediante el boss menu de qb-management, depositar fondos en la cuenta del taller,
o directamente en DB:
```sql
UPDATE mechanic_data SET balance = 50000 WHERE name = 'lscustoms';
```

---

## 6. Fase 4: Testing como Mecánico empleado

> Conectar con personaje que tiene `job = mechanic, grade ≥ 1`

### 6.1 Entrar al taller LS Customs
- [ ] Acercarse a zona empleado (`-324.2, -132.0, 38.54`)
- [ ] qb-target muestra opciones de empleado: **Entrar de guardia**, **Ver pedidos**, **Usar elevador**

### 6.2 Activar el turno de guardia
- [ ] Usar opción "Entrar de guardia" → notificación de ox_lib confirmando estado
- [ ] Verificar: `SELECT * FROM mechanic_data WHERE name='lscustoms'` → campo `on_duty` actualizado

### 6.3 Usar el elevador de coches
- [ ] Acercar vehículo al elevador (coords `-357.45, -114.17, 38.7, 339.89` en config)
- [ ] Presionar `E` → animación de subida/bajada del coche
- [ ] Verificar que no hay errores en consola F8

### 6.4 Tomar un pedido de cliente (necesita cliente en zona)
- [ ] Con cliente en zona y solicitando servicio, aparece notificación al mecánico
- [ ] Aceptar pedido desde tablet

### 6.5 Abrir tablet como mecánico
```
/tablet        → abre la tablet de mecánico (o F1 si está configurado)
```
- [ ] Tablet se abre correctamente (UI web, no errores JS en F8)
- [ ] Pestaña "Pedidos" muestra pedidos activos
- [ ] Pestaña "Empleados" muestra lista del taller
- [ ] Pestaña "Inventario" muestra el stash del taller

### 6.6 Servicio de mantenimiento
Vehículo con partes dañadas (motor < 100%) en zona de mecánico:
- [ ] Mecánico activa servicio sobre el vehículo
- [ ] Aparece progress bar (ox_lib) con animación
- [ ] Skill check (ox_lib) se activa si está configurado
- [ ] Al completar → motor restaurado, item de `engine_oil` consumido del inventario
- [ ] Historial de servicio guardado en `mechanic_servicing_history`

### 6.7 Compra en tienda de suministros (shop de LS Customs)
- [ ] Acercarse al marcador "Servicing Supplies" en coords `(-345.54, -131.32, 39.01)`
- [ ] qb-target muestra opción de tienda
- [ ] Comprar `engine_oil` por 50€, `spark_plug` por 100€, etc.
- [ ] Verificar que el cobro se descuenta del balance del jugador (`bank`)

### 6.8 Compra de tuning avanzado
- [ ] Acercarse al marcador "Advanced Upgrades" en coords `(-343.79, -139.92, 39.01)`
- [ ] Comprar `turbocharger` por 25.000€ (si tiene fondos)
- [ ] Item aparece en inventario

### 6.9 Stash del taller
- [ ] Acercarse al marcador "Parts Bin" en coords `(-339.24, -132.2, 39.01)`
- [ ] codem-inventory abre el stash correcto
- [ ] Guardar y recuperar items sin errores

---

## 7. Fase 5: Testing como Dueño de taller (Boss)

> Conectar con personaje que tiene `job = mechanic, grade = 4`

### 7.1 Boss Menu desde qb-management
- [ ] Ir a coords `(-347.59, -133.35, 39.01)` (zona del boss menu en qb-management)
- [ ] Interactuar → abrir menú de gestión
- [ ] Verificar balance de sociedad
- [ ] Depositar/retirar fondos

### 7.2 Gestión de empleados desde tablet
- [ ] Abrir tablet (`/tablet`)
- [ ] Contratar empleado: ingresar citizenid del jugador online
- [ ] Asignar role/rango dentro del taller
- [ ] Despedir empleado → verificar en `mechanic_employees`

### 7.3 Crear pedido de tuning desde tablet
- [ ] Pestaña "Pedidos" → Crear nuevo pedido de tuning para un vehículo
- [ ] Configurar precio y piezas requeridas
- [ ] Verificar que se crea en `mechanic_orders`

### 7.4 Emisión de factura
- [ ] Desde tablet, emitir factura a cliente
- [ ] Verificar que el cliente recibe la factura
- [ ] Cliente paga → el importe entra a la cuenta del taller (qb-management)
- [ ] Verificar en `mechanic_invoices` que el registro está marcado como `paid = 1`

### 7.5 Comisiones (si configurado)
Config actual: `commission = 0` (sin comisión). Si se activa > 0:
- [ ] Al pagar factura, el mecánico que atendió recibe `commission%` en su cuenta

---

## 8. Fase 6: Testing como Cliente (civiles)

> Personaje sin job de mecánico, con coche y dinero en banco

### 8.1 Llegar a LS Customs como cliente
- [ ] Aparcar en zona de clientes (coords `-337.25, -137.2, 38.35`)
- [ ] qb-target muestra opción "Pedir servicio" o "Ver precios"

### 8.2 Solicitar reparación básica
- [ ] Forzar daño en el coche (F8: `SetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1),false), 200)`)
- [ ] Solicitar reparación
- [ ] Si mecánico on-duty: aparece notificación al mecánico
- [ ] Si nadie on-duty: mensaje informativo (según `Config.AllowFixingAtOwnedMechanicsIfNoOneOnDuty = false`)

### 8.3 Solicitar tuning (requiere item)
- [ ] Pedir instalación de `turbocharger` (el mecánico necesita el item en stash)
- [ ] Mecánico acepta pedido, instala el item con skillcheck
- [ ] Turbo instalado en el vehículo → persiste en la BD

### 8.4 Pagar con banco
- [ ] Seleccionar pago con `Config.PlayerBalance = "bank"`
- [ ] Verificar que el balance del jugador disminuye
- [ ] Verificar que la cuenta del taller aumenta

### 8.5 Nitrous (cliente compra o mecánico instala)
- [ ] Mecánico instala `nitrous_install_kit` en el coche
- [ ] Cliente recibe `nitrous_bottle`
- [ ] Usar NOS en el coche: `RMENU` (botón configurado en config)
- [ ] Verificar efectos visuales y sonoros
- [ ] Al vaciar, el item cambia a `empty_nitrous_bottle`

### 8.6 Stance / Suspensión
- [ ] Cliente solicita cambio de stance
- [ ] Mecánico abre menú de stance en el coche
- [ ] Ajustar altura de suspensión, camber, track width dentro de los límites del config
- [ ] Los cambios se guardan en `mechanic_vehicledata`

---

## 9. Fase 7: Bennys (Self-Service)

> Vehículo propio, sin necesidad de mecánico activo

### 9.1 Llegar a Bennys
- [ ] Coords: `(-211.6, -1324.73, 30.23)`
- [ ] Zona de 8.0 unidades de radio

### 9.2 Opciones disponibles como cliente
- [ ] Reparación (precio: 500€ + 1% valor vehículo según `percentVehVal`)
- [ ] Cosmética: bodykit, color, llantas
- [ ] Respray
- [ ] Ruedas
- [ ] Neon lights, headlights, tyre smoke, extras
- [ ] Stance

### 9.3 Probar cambio de matrícula
```
/preview         → comando de prueba de matrícula (Config.ChangePlateDuringPreview)
```

### 9.4 Verificar que los mods persisten en `mechanic_vehicledata`
```sql
SELECT * FROM mechanic_vehicledata WHERE plate = 'ABC123';
```

---

## 10. Fase 8: Performance y Resmon

### 10.1 Activar resmon
```
resmon 1         → en consola F8 del juego
```

### 10.2 Valores de referencia (idle, sin jugadores activos)
```
jg-mechanic         → < 0.2ms idle | < 3ms active
jg-vehiclemileage   → < 0.05ms idle | < 0.1ms active
jg-mechanic-props   → < 0.05ms idle
```

### 10.3 Durante uso activo (mecánico trabajando)
```
jg-mechanic         → < 2ms (aceptable) | > 5ms (investigar)
```

### 10.4 Verificar loops de mileage
El script jg-vehiclemileage tiene un loop que actualiza el millaje cada X segundos.
- [ ] Conducir vehículo durante 2 minutos
- [ ] `SELECT mileage FROM player_vehicles WHERE citizenid = '[tu_id]' LIMIT 1;`
- [ ] Valor debe haber aumentado

---

## 11. Referencia de comandos y cheats de admin

### Comandos de servidor (consola txAdmin)
```bash
restart jg-mechanic          # restart recurso
restart jg-vehiclemileage    # restart mileage
refresh                      # refrescar lista de recursos
```

### Comandos in-game (admin)
```
/vfix                   # reparar vehículo completamente
/mechanicadmin          # panel admin de mecánico
/setjob [id] mechanic 4 # dar job mechanic grade 4
/give [id] [item] [qty] # dar item
```

### Comandos de debug (F8 del cliente)
```javascript
// Forzar daño al motor:
SetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1),false), 200)

// Ver velocidad y mileage:
print(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1),false)) * 3.6)

// Teleport a Bennys:
SetEntityCoords(GetPlayerPed(-1), -211.6, -1324.73, 30.23)

// Teleport a LS Customs:
SetEntityCoords(GetPlayerPed(-1), -337.25, -137.2, 38.35)
```

### SQL útil de debug
```sql
-- Ver estado completo de todos los talleres:
SELECT * FROM mechanic_data;

-- Ver empleados del taller:
SELECT * FROM mechanic_employees WHERE mechanic = 'lscustoms';

-- Ver pedidos activos:
SELECT * FROM mechanic_orders WHERE fulfilled = 0;

-- Ver facturas pendientes:
SELECT * FROM mechanic_invoices WHERE paid = 0;

-- Dar item de mecánico a jugador (vía qb-core):
INSERT INTO items VALUES ... -- usar /give en-game es más seguro

-- Ver mileage de un vehículo:
SELECT plate, mileage FROM player_vehicles ORDER BY mileage DESC LIMIT 20;

-- Limpiar historial de servicio de un vehículo:
DELETE FROM mechanic_servicing_history WHERE plate = 'ABC123';
```

---

## 12. Tabla de errores conocidos y sus fixes

| Error | Causa | Fix |
|---|---|---|
| `attempt to call a nil value (field 'GetPlayerData')` | `QBCore.Functions.*` son nil en cross-resource export | **CORREGIDO** en `cl-qb.lua` y `cl-functions.lua` — usa `Globals.PlayerData` |
| `[SQL ERROR] There was an error while automatically running the required SQL` | `MySQL.transaction.await` falla con oxmysql 2.x | **CORREGIDO** en `sv-initsql.lua` — usa queries individuales |
| `Table 'admirales.mechanic_data' doesn't exist` | SQL no ejecutado | Reiniciar jg-mechanic (el nuevo sv-initsql lo crea) o ejecutar `run.sql` manualmente |
| `No such export ox_target` | ox_target no instalado | **CORREGIDO** → `Config.Target = "qb-target"` |
| Items sin imagen en codem-inventory | Images no copiadas | **CORREGIDO** — imágenes copiadas a `codem-inventory/html/itemimages/` |
| Items no registrados en inventario | No estaban en qb-core items.lua | **CORREGIDO** — 40+ items añadidos a `qb-core/shared/items.lua` |
| Notificaciones en inglés | Locale no configurado | **CORREGIDO** → `Config.Locale = "es"` |
| Factura no descuenta de taller | qb-management no tiene la cuenta `mechanic` | Verificar `qb-management/config.lua` tiene `mechanic` en `BossMenus` |
| Elevador no funciona | qb-target zona no registrada | Verificar que `jg-mechanic-props` y `jg-mechanic` arrancan sin error |
| Tablet no abre | Comando `/tablet` no registrado | Verificar consola — posible error en sv-main.lua o cl-tablet.lua |
| Skill check no aparece | ox_lib no cargado / Config.SkillCheck incorrecto | Verificar `GetResourceState("ox_lib") == "started"` en consola |
| Mileage no actualiza | jg-vehiclemileage no arrancó o SQL de mileage falló | `restart jg-vehiclemileage`, verificar columna `mileage` en `player_vehicles` |
| Balance del taller siempre 0 | `Config.UseSocietyFund = false` (usa balance jugador) | Cambiar a `true` si se quiere cuenta de sociedad, o verificar qb-management |

---

## CHECKLIST FINAL PRE-PRODUCCIÓN

```
INFRAESTRUCTURA
[ ] Sin SCRIPT ERROR en consola al arrancar jg-mechanic
[ ] 7 tablas mechanic_* creadas en DB
[ ] Columna mileage presente en player_vehicles
[ ] mechanic_data tiene filas: bennys, lscustoms

INTEGRACIONES
[ ] ox_lib: notificaciones y progress bars funcionan
[ ] lation_ui: menus y DrawText funcionan
[ ] codem-inventory: stash, shop items con imágenes
[ ] qb-target: zonas de interacción visibles
[ ] qb-management: cuenta mechanic con fondos
[ ] qb-core items: 40+ items de mechanic registrados

FUNCIONALIDAD BÁSICA
[ ] Blips en mapa (bennys + lscustoms)
[ ] Zona cliente LS Customs → solicitar servicio
[ ] Zona empleado LS Customs → entrar de guardia
[ ] Elevador funciona
[ ] Tablet abre y carga correctamente
[ ] Tienda de suministros funciona y cobra
[ ] Stash del taller funciona

FLUJO COMPLETO
[ ] Cliente solicita reparación → mecánico acepta → repara → cobra → factura paid=1
[ ] Cliente solicita tuning → mecánico instala item → persiste en mechanic_vehicledata
[ ] Bennys self-service: respray, llantas, cosmética
[ ] Nitrous: instalación → uso → botella vacía
[ ] Factura enviada → cliente paga → fondos en cuenta taller

PERFORMANCE
[ ] jg-mechanic idle < 0.2ms
[ ] jg-mechanic active < 3ms
[ ] Sin memory leaks tras 10 minutos de uso
```

---

> **Nota RAC**: Los fixes aplicados durante esta instalación están documentados en los archivos fuente con comentarios `-- RAC-fix:`.
> Referencia: `cl-qb.lua`, `cl-functions.lua`, `sv-initsql.lua`.
> Auditoría: AUD-046 · BYPASS SENIOR aprobado · Ver `AUDIT_NOTES.md` en cada recurso del pack.
