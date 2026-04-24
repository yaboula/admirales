-- =====================================================
-- =====================================================

local function splitString(inputStr, delimiter)
  local result = {}
  for match in string.gmatch(inputStr, "([^" .. delimiter .. "]+)") do
    table.insert(result, string.gsub(match, "^%s*(.-)%s*$", "%1"))
  end
  return result
end

function initSQL()
  if Config.AutoRunSQL then
    local success, err = pcall(function()
      local file = assert(io.open(GetResourcePath(GetCurrentResourceName()) .. "/install/database/run.sql", "rb"))
      local content = file:read("*all")
      file:close()
      -- RAC-fix: MySQL.transaction.await falla con oxmysql 2.x por desalineamiento de args al cruzar
      -- el boundary Lua→JS (nil primer arg en el helper await() desplaza queries→null en JS).
      -- Solución: ejecutar cada CREATE TABLE individualmente con MySQL.query.await, que sí funciona.
      local queries = splitString(content, ";")
      for _, query in ipairs(queries) do
        if query ~= "" then
          MySQL.query.await(query)
        end
      end
    end)
    if not success then
      print("^1[SQL ERROR] There was an error while automatically running the required SQL. Don't worry, you just need to run the SQL file for your framework, found in the 'install/database' folder manually. If you've already ran the SQL code previously, and this error is annoying you, set Config.AutoRunSQL = false^0")
      print("^1[SQL ERROR detail] " .. tostring(err) .. "^0")
    end
  end
end
initSQL = initSQL
