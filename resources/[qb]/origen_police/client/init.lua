local L0_1, L1_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L1_2 = tonumber

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  A0_2 = L1_2

  L1_2 = pairs

  L2_2 = Config

  L2_2 = L2_2.BossGrade

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    if L6_2 <= A0_2 then

      L7_2 = true

      return L7_2

    end

  end

  L1_2 = false

  return L1_2

end

IsBoss = L0_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  if A1_2 then

    L2_2 = 10

    L2_2 = L2_2 ^ A1_2

    L3_2 = math

    L3_2 = L3_2.floor

    L4_2 = A0_2 * L2_2

    L4_2 = L4_2 + 0.5

    L3_2 = L3_2(L4_2)

    L3_2 = L3_2 / L2_2

    return L3_2

  else

    L2_2 = math

    L2_2 = L2_2.floor

    L3_2 = A0_2 + 0.5

    return L2_2(L3_2)

  end

end

FW_Round = L0_1

L0_1 = Citizen

L0_1 = L0_1.CreateThread

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  function L0_2(A0_3, A1_3)

    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3

    if not A1_3 then

      A1_3 = ""

    end

    L2_3 = pairs

    L3_3 = A0_3

    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)

    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do

      L8_3 = type

      L9_3 = L7_3

      L8_3 = L8_3(L9_3)

      if "table" == L8_3 then

        L8_3 = L0_2

        L9_3 = L7_3

        L10_3 = A1_3

        L11_3 = "  "

        L10_3 = L10_3 .. L11_3

        L8_3(L9_3, L10_3)

      elseif "__index" == L6_3 then

        L8_3 = type

        L9_3 = L7_3

        L8_3 = L8_3(L9_3)

        if "function" == L8_3 then

          return L7_3

        end

      end

    end

  end

  L1_2 = getmetatable

  L2_2 = exports

  L2_2 = L2_2["pma-voice"]

  L1_2 = L1_2(L2_2)

  L2_2 = type

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  if "table" == L2_2 then

    L2_2 = L0_2

    L3_2 = L1_2

    L2_2 = L2_2(L3_2)

    L3_2 = pcall

    function L4_2()

      local L0_3, L1_3, L2_3

      L0_3 = L2_2

      L1_3 = "pma-voice"

      L2_3 = "playerTargets"

      L0_3(L1_3, L2_3)

    end

    L3_2, L4_2 = L3_2(L4_2)

    L5_2 = pcall

    function L6_2()

      local L0_3, L1_3, L2_3

      L0_3 = L2_2

      L1_3 = "pma-voice"

      L2_3 = "toggleVoice"

      L0_3(L1_3, L2_3)

    end

    L5_2, L6_2 = L5_2(L6_2)

    if not L3_2 and not L5_2 then

      L7_2 = print

      L8_2 = "^4origen_police: Can't find pma-voice playerTargets and toggleVoice exports, please make sure to read the installation.txt file"

      L7_2(L8_2)

      return

    end

    if not L3_2 then

      L7_2 = print

      L8_2 = "^4origen_police: Can't find pma-voice playerTargets export, please make sure to have the latest version of pma-voice or ask for support in the discord server"

      L7_2(L8_2)

      return

    end

  end

end

L0_1(L1_1)

L0_1 = Config

L0_1 = L0_1.OxLibMenu

if L0_1 then

  L0_1 = lib

  if not L0_1 then

    L0_1 = Debuger

    L1_1 = "You have set the menu to ox_lib but you don't have uncommented the ox_lib line in the fxmanifest of origen_police"

    L0_1(L1_1)

  end

end

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = AddEventHandler

  L4_2 = "__cfx_export_"

  L5_2 = A0_2

  L6_2 = "_"

  L7_2 = A1_2

  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2

  function L5_2(A0_3)

    local L1_3, L2_3

    L1_3 = A0_3

    L2_3 = A2_2

    return L1_3(L2_3)

  end

  L3_2(L4_2, L5_2)

end

AddReplaceExport = L0_1

