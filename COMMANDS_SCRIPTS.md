# Comandos por script

Inventario de comandos para staff/comunidad.  
Objetivo: anunciar comandos reales activos y evitar olvidos tras cada instalacion.

## Leyenda

- `ACTIVO`: comando registrado y habilitado por configuracion.
- `CONDICIONAL`: depende de config/permisos/estado.
- `DEBUG`: no recomendado para jugadores finales.

## Scripts y comandos

### luxu_admin (`resources/[standalone]/luxu_admin`)

Comandos leidos desde `config/config.json` + `config/commands/sv_commands.lua`.

- `/admin` - `ACTIVO` - abrir panel admin.
- `/luxu` - `ACTIVO` - quick menu.
- `/tpm` - `ACTIVO` - teleport al marcador.
- `/back` - `ACTIVO` - volver a ultima posicion.
- `/tp` - `ACTIVO` - teleport a jugador o coordenadas.
- `/bring` - `ACTIVO` - traer jugador.
- `/report` - `ACTIVO` - menu de reportes (jugadores).
- `/noclip` - `ACTIVO` - toggle noclip (con permisos).
- `/spectate` - `ACTIVO` - espectear jugador.
- `/staff` - `ACTIVO` - listar staff online.
- `/ban` - `ACTIVO` - ban con duracion y motivo.
- `/sentence` - `ACTIVO` - ver condena restante.
- `/jail` - `ACTIVO` - encarcelar jugador.
- `/admincar` - `ACTIVO` - guardar vehiculo admin.
- `/myidentifiers` - `ACTIVO` - utilitario interno de identificadores.

### jg-mechanic pack

Incluye:
- `resources/[standalone]/jg-mechanic-props`
- `resources/[standalone]/jg-vehiclemileage`
- `resources/[standalone]/jg-mechanic`

Comandos detectados:

- `/mechanicadmin` - `ACTIVO` (nombre configurable por `Config.MechanicAdminCommand`).
- `/vfix` - `ACTIVO` (nombre configurable por `Config.FullRepairAdminCommand`).
- `/tablet` - `CONDICIONAL` (depende de `Config.UseTabletCommand`, ahora configurado como `"tablet"`).
- `+nitrousKeymap` - `ACTIVO` (comando interno de keymap).
- `-nitrousKeymap` - `ACTIVO` (comando interno de keymap).

### origen_police (`resources/[qb]/origen_police`)

Comandos detectados:

- `/qrr` - `ACTIVO` - alerta de riesgo del agente.
- `/10-20` - `ACTIVO` - compartir posicion.
- `/rpol` - `ACTIVO` - radio policial.
- `/fixstuck` - `ACTIVO` - reset visual si queda bug de animacion/camara.
- `/origendiag` - `DEBUG` - diagnostico tecnico.
- `/celda` - `ACTIVO` - envio a federal (server command, con validaciones).

### 0r-illegalpack (`resources/[standalone]/0r-illegalpack`)

- `/scenedebug` - `DEBUG` - comando de debug detectado en `shared/client_debug.lua`.

### mWeed (`resources/[qb]/mWeed`)

- Sin comandos de chat detectados por patron (`RegisterCommand`, `QBCore.Commands.Add`, `lib.addCommand`).

### codem-craftv2 (`resources/[qb]/codem-craftv2`)

- Sin comandos de chat detectados por patron (`RegisterCommand`, `QBCore.Commands.Add`, `lib.addCommand`).

### 3fe_woodbox (`resources/[standalone]/3fe_woodbox`)

- Sin comandos de chat detectados por patron (`RegisterCommand`, `QBCore.Commands.Add`, `lib.addCommand`).

### lation_ui (`resources/[standalone]/lation_ui`)

- Sin comandos de chat detectados por patron (`RegisterCommand`, `QBCore.Commands.Add`, `lib.addCommand`).

## Checklist de publicacion a Discord (staff)

Por cada script nuevo/modificado:

1. Publicar nombre del script y version.
2. Publicar lista de comandos (copiar desde este archivo).
3. Publicar permisos requeridos (admin/mod/job).
4. Publicar impacto (reemplaza cual script, dependencias, orden de carga).
5. Confirmar fecha/hora de despliegue y rollback rapido.
