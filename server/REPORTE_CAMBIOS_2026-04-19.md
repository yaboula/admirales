# Reporte Tecnico de Cambios - 2026-04-19

## Resumen
- Se estabilizo la base del proyecto con multiples ajustes ya presentes en el arbol de trabajo.
- Se realizaron correcciones y restauraciones en `codem-inventory` para recuperar funcionamiento del inventario y compatibilidad con recursos dependientes.
- Se mantiene un bypass para el flujo de split en rutas custom para evitar conflictos con eventos internos encriptados.

## Codem Inventory
- Ruta: `resources/[qb]/codem-inventory`
- Estado: Instalado y en revision tecnica.
- Accion aplicada: restauracion de archivos funcionales desde respaldo no ofuscado y ajuste del flujo de split con eventos custom.

## Estado del Split
- Estado actual: **PENDIENTE**
- Alcance pendiente de verificacion:
  - Inventario principal
  - Stash
  - Maletero
  - Guantera
- Criterios de cierre:
  - Consistencia visual cliente
  - Consistencia de cantidades servidor-cliente
  - Ausencia de duplicacion o perdida de items

## Nota Operativa
- Este reporte se sube junto al commit para dejar trazabilidad en GitHub.