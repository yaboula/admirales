local L0_1, L1_1, L2_1

L0_1 = Config

L0_1 = L0_1.ConfiscateSystem

if not L0_1 then

  return

end

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GetPlayerConfiscatedVehicles"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L3_2 = A1_2

  L4_2 = GetConfiscatedVehiclesByOwner

  if L2_2 then

    L5_2 = L2_2.PlayerData

    if L5_2 then

      L5_2 = L2_2.PlayerData

      L5_2 = L5_2.citizenid

      if L5_2 then

        goto lbl_16

      end

    end

  end

  L5_2 = false

  ::lbl_16::

  L4_2, L5_2 = L4_2(L5_2)

  L3_2(L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:TakeOutConfiscatedVehicle"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = A1_2

  L4_2 = PayConfiscatedVehicle

  L5_2 = FW_GetPlayer

  L6_2 = A0_2

  L5_2 = L5_2(L6_2)

  if L5_2 then

    L5_2 = L5_2.PlayerData

  end

  L5_2 = L5_2.citizenid

  L6_2 = A2_2

  L7_2 = GetConfiscatedVehicleByPlate

  L8_2 = A2_2

  L7_2 = L7_2(L8_2)

  L7_2 = L7_2.billPrice

  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2, L7_2)

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:Impound"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = source

  if not A1_2 or not A1_2 then

    A1_2 = 0

  end

  L3_2 = ConfiscateVehicle

  L4_2 = 2

  L5_2 = A0_2

  L6_2 = Config

  L6_2 = L6_2.ConfiscateParkName

  L7_2 = A1_2

  L8_2 = L2_2

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

