local L0_1, L1_1, L2_1

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

L0_1 = RegisterNetEvent

L1_1 = "origen_police:SetMetaData"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = FW_GetPlayer

  L3_2 = source

  L2_2 = L2_2(L3_2)

  if not L2_2 then

    return

  end

  L3_2 = L2_2.Functions

  L3_2 = L3_2.SetMetaData

  L4_2 = A0_2

  L5_2 = A1_2

  L3_2(L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GetPlayerMetadata"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if L2_2 then

    L3_2 = L2_2.PlayerData

    if L3_2 then

      goto lbl_13

    end

  end

  L3_2 = A1_2

  L4_2 = false

  L3_2(L4_2)

  do return end

  ::lbl_13::

  L3_2 = A1_2

  L4_2 = L2_2.Functions

  L4_2 = L4_2.GetMetaData

  L4_2 = L4_2()

  if not L4_2 then

    L4_2 = {}

  end

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

function L0_1(A0_2)

  local L1_2, L2_2

  L1_2 = math

  L1_2 = L1_2.floor

  L2_2 = A0_2 + 0.5

  return L1_2(L2_2)

end

FW_Round = L0_1

