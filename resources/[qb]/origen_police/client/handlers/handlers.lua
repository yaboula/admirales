local L0_1, L1_1

L0_1 = {}

L0_1.name = "vehicle_sit"

L0_1.lastVehicle = nil

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = GetVehiclePedIsIn

  L3_2 = L1_2

  L4_2 = false

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = nil

  if 0 ~= L2_2 then

    L3_2 = L2_2

  end

  L4_2 = A0_2.lastVehicle

  A0_2.lastVehicle = L3_2

  L5_2 = L3_2

  L6_2 = L4_2

  return L5_2, L6_2

end

L0_1.check = L1_1

VehicleSitHandler = L0_1

