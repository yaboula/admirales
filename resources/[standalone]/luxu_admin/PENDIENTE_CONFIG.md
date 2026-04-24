# ⏳ PENDIENTE — Configuración Manual luxu_admin

**Recurso:** `luxu_admin v1.14.1`
**Instalación:** INST-027
**Fecha nota:** 2026-04-23

> Estos ítems requieren datos del owner y se deben completar manualmente antes de abrir el servidor a jugadores.

---

## 1. 🔑 `license2` del Owner (config.json)

**Archivo:** `config/config.json` → campo `"owners"`

**Qué hacer:**
1. En FiveM, conectar al servidor
2. Abrir consola F8 → ejecutar `status` o ver el ID de tu player
3. En la consola del servidor ejecutar: `print(GetPlayerIdentifierByType([tu_id], 'license2'))`
4. Copiar el resultado (formato: `license2:xxxxxxxxxxxxxxxxx`)
5. Reemplazar o añadir en `config.json`:

```json
"owners": ["license2:TU_LICENSE2_AQUI"]
```

**Estado:** ⏳ Pendiente

---

## 2. 🤖 Discord Bot (discord.json + server.cfg)

**Documentación oficial:** https://docs.luxu.gg/

**Qué necesitas:**
1. Crear un Bot de Discord en https://discord.com/developers/applications
2. Copiar el **Bot Token**
3. Añadir el bot a tu servidor de Discord con permisos de Administrator
4. Ir a https://luxu.app → crear equipo con tu Transaction ID de Tebex → obtener API Key

**Cambios cuando estés listo:**

### En `server.cfg`:
```cfg
set luxu_admin_api_key "TU_API_KEY_AQUI"
```

### En `config/discord.json`:
El bot ya tiene comandos slash configurados (ban, kick, jail, giveitem, revive, etc.)
Solo necesita el token para activarse desde el web panel de luxu.app.

**Estado:** ⏳ Pendiente

---

## 4. 🌐 Web Panel Externo (luxu.app)

**URL del panel:** https://luxu.app

**Qué hacer:**
1. Ir a https://checkout.tebex.io/payment-history → copiar tu Transaction ID
2. Ir a https://luxu.app → crear equipo → pegar el Transaction ID
3. Obtendrás una **API Key**
4. Añadir al `server.cfg`: `set luxu_admin_api_key "TU_KEY"`
5. Restart `luxu_admin`

**Beneficios del web panel:**
- Gestión de staff/permisos desde web (sin estar in-game)
- Historial de bans/warns accesible remotamente
- Discord bot integration

**Estado:** ⏳ Pendiente

---

> **Nota:** Una vez completados estos ítems, hacer `restart luxu_admin` en la consola del servidor.
