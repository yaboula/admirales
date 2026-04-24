local L0_1, L1_1, L2_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:ReloadShapes"

function L2_1()

  local L0_2, L1_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "UpdateShapes"

  L0_2(L1_2)

end

L0_1(L1_1, L2_1)

