local L0_1, L1_1, L2_1

L0_1 = Config

L0_1 = L0_1.ConfiscateSystem

if not L0_1 then

  return

end

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = SpawnConfiscatedVehicles

  L2_2 = L2_2[A1_2]

  if not L2_2 then

    L3_2 = ShowNotification

    L4_2 = "There isn't spawn coords for confiscated vehicles in this station"

    return L3_2(L4_2)

  end

  L3_2 = FW_TriggerCallback

  L4_2 = "origen_police:server:TakeOutConfiscatedVehicle"

  function L5_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3

    if not A0_3 then

      return

    end

    L1_3 = DoScreenFadeOut

    L2_3 = 250

    L1_3(L2_3)

    L1_3 = Wait

    L2_3 = 1000

    L1_3(L2_3)

    L1_3 = Config

    L1_3 = L1_3.Framework

    if "qbcore" == L1_3 then

      L1_3 = A0_3.vehicle

      if L1_3 then

        goto lbl_22

      end

    end

    L1_3 = json

    L1_3 = L1_3.decode

    L2_3 = A0_3.vehicle

    L1_3 = L1_3(L2_3)

    L1_3 = L1_3.model

    ::lbl_22::

    L2_3 = RequestModel

    L3_3 = L1_3

    L2_3(L3_3)

    while true do

      L2_3 = HasModelLoaded

      L3_3 = L1_3

      L2_3 = L2_3(L3_3)

      if L2_3 then

        break

      end

      L2_3 = Wait

      L3_3 = 0

      L2_3(L3_3)

    end

    L2_3 = CreateVehicle

    L3_3 = L1_3

    L4_3 = L2_2.x

    L5_3 = L2_2.y

    L6_3 = L2_2.z

    L7_3 = L2_2.w

    L8_3 = true

    L9_3 = true

    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)

    L3_3 = Config

    L3_3 = L3_3.Framework

    if "qbcore" == L3_3 then

      L3_3 = json

      L3_3 = L3_3.decode

      L4_3 = A0_3.mods

      L3_3 = L3_3(L4_3)

      if L3_3 then

        goto lbl_57

      end

    end

    L3_3 = json

    L3_3 = L3_3.decode

    L4_3 = A0_3.vehicle

    L3_3 = L3_3(L4_3)

    ::lbl_57::

    if nil ~= L3_3 then

      L4_3 = {}

      if L3_3 ~= L4_3 then

        L4_3 = FW_SetVehicleProperties

        L5_3 = L2_3

        L6_3 = L3_3

        L4_3(L5_3, L6_3)

      end

    end

    L4_3 = SetVehicleNumberPlateText

    L5_3 = L2_3

    L6_3 = A0_3.plate

    L4_3(L5_3, L6_3)

    L4_3 = SetVehicleDirtLevel

    L5_3 = L2_3

    L6_3 = 0.0

    L4_3(L5_3, L6_3)

    L4_3 = SetEntityHeading

    L5_3 = L2_3

    L6_3 = L2_2.w

    L4_3(L5_3, L6_3)

    L4_3 = TriggerEvent

    L5_3 = "vehiclekeys:client:SetOwner"

    L6_3 = A0_3.plate

    L4_3(L5_3, L6_3)

    L4_3 = SetVehicleEngineOn

    L5_3 = L2_3

    L6_3 = true

    L7_3 = true

    L4_3(L5_3, L6_3, L7_3)

    L4_3 = TaskEnterVehicle

    L5_3 = PlayerPedId

    L5_3 = L5_3()

    L6_3 = L2_3

    L7_3 = 2000

    L8_3 = -1

    L9_3 = 0

    L10_3 = 3

    L11_3 = 0

    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)

    L4_3 = Wait

    L5_3 = 600

    L4_3(L5_3)

    L4_3 = DoScreenFadeIn

    L5_3 = 250

    L4_3(L5_3)

  end

  L6_2 = A0_2

  L3_2(L4_2, L5_2, L6_2)

end

TakeOutImpound = L0_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:openConfiscatedMenu"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2

  L2_2 = nil

  L3_2 = FW_TriggerCallback

  L4_2 = "origen_police:server:GetPlayerConfiscatedVehicles"

  function L5_2(A0_3)

    local L1_3

    L1_3 = A0_3 or nil

    if not A0_3 then

      L1_3 = {}

    end

    L2_2 = L1_3

  end

  L3_2(L4_2, L5_2)

  while nil == L2_2 do

    L3_2 = Wait

    L4_2 = 0

    L3_2(L4_2)

  end

  L3_2 = {}

  L4_2 = {}

  L5_2 = Config

  L5_2 = L5_2.Translations

  L5_2 = L5_2.ImpoundedVehicles

  L4_2.header = L5_2

  L4_2.isMenuHeader = true

  L3_2[1] = L4_2

  L4_2 = type

  L5_2 = L2_2

  L4_2 = L4_2(L5_2)

  if "table" ~= L4_2 then

    L4_2 = {}

    L2_2 = L4_2

  end

  L4_2 = pairs

  L5_2 = L2_2

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = table

    L10_2 = L10_2.insert

    L11_2 = L3_2

    L12_2 = {}

    L13_2 = L9_2.vehicle

    L14_2 = " - "

    L15_2 = L9_2.billPrice

    L16_2 = "$"

    L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2

    L12_2.header = L13_2

    L13_2 = L9_2.plate

    L12_2.txt = L13_2

    L12_2.icon = "fa-solid fa-car"

    L13_2 = {}

    L13_2.isAction = true

    function L14_2()

      local L0_3, L1_3, L2_3

      L0_3 = TakeOutImpound

      L1_3 = L9_2.plate

      L2_3 = A1_2

      L0_3(L1_3, L2_3)

    end

    L13_2.event = L14_2

    L12_2.params = L13_2

    L10_2(L11_2, L12_2)

  end

  L4_2 = OpenMenu

  L5_2 = L3_2

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

