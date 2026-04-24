## AUDIT_NOTES — jg-mechanic

| Campo | Valor |
|:---|:---|
| **ID Auditoría** | `AUD-046` |
| **Fecha** | 2026-04-24 |
| **Estado** | ⚠️ **BYPASS SENIOR — APROBADO CON RIESGO CONOCIDO** |
| **Versión** | `v1.6.5` |
| **Incluye** | `jg-mechanic` + dependencias del pack (`jg-vehiclemileage`, `jg-mechanic-props`) |
| **Reporte** | `C:\admirales\script_ver\script_ver\reports\audit_AUD-046_jg-mechanic_2026-04-24.md` |
| **Notas** | `C:\admirales\script_ver\script_ver\reports\audit_AUD-046_jg-mechanic_2026-04-24_notes.md` |

### Riesgo aceptado (supply-chain)
- Origen redistribuido/leak (“decrypted by … / Ak Leaks”). La integridad vs. recurso oficial no es verificable. Se acepta por BYPASS SENIOR.

### Hallazgos relevantes (cerrados en auditoría)
- Eventos/callbacks que permitían escrituras de BD/statebags sin ownership fueron mitigados (ver reporte AUD-046).

### Dependencias declaradas (fxmanifest)
- `oxmysql`
- `ox_lib`
- `jg-vehiclemileage`
- Requiere server build `7290` y `onesync` (declarado por el recurso)

### Notas para instalación
- No modificar `.lua`/`.js` runtime sin flujo RAC + re-auditoría.
- Revisar/definir webhooks si se desea logging: `server/sv-webhooks.lua` (configurable).

