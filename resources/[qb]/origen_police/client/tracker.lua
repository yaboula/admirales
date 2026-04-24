local L0_1, L1_1, L2_1, L3_1

L0_1 = false

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:OnPlayerLoaded"

function L3_1()

  local L0_2, L1_2

  L0_2 = TriggerServerEvent

  L1_2 = "origen_police:server:GetAnkleCuff"

  L0_2(L1_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "AnckleShock"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:ankleshock"

  L4_2 = A0_2.id

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = L0_1

  if not L1_2 then

    return

  end

  L1_2 = Config

  L1_2 = L1_2.TrackerCloths

  if L1_2 then

    L1_2 = Config

    L1_2 = L1_2.TrackerCloths

    L1_2 = L1_2.enabled

    if L1_2 then

      L1_2 = SetPedComponentVariation

      L2_2 = PlayerPedId

      L2_2 = L2_2()

      L3_2 = 7

      L4_2 = GetEntityModel

      L5_2 = PlayerPedId

      L5_2, L6_2 = L5_2()

      L4_2 = L4_2(L5_2, L6_2)

      L5_2 = GetHashKey

      L6_2 = "mp_m_freemode_01"

      L5_2 = L5_2(L6_2)

      if L4_2 == L5_2 then

        L4_2 = Config

        L4_2 = L4_2.TrackerCloths

        L4_2 = L4_2.male

        if L4_2 then

          goto lbl_35

        end

      end

      L4_2 = Config

      L4_2 = L4_2.TrackerCloths

      L4_2 = L4_2.female

      ::lbl_35::

      L5_2 = 0

      L6_2 = 0

      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)

    end

  end

  if A0_2 then

    return

  end

  while true do

    L1_2 = L0_1

    if not L1_2 then

      break

    end

    L1_2 = AddTrackerObj

    L2_2 = true

    L1_2(L2_2)

    L1_2 = Wait

    L2_2 = 3000

    L1_2(L2_2)

  end

end

AddTrackerObj = L1_1

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = false

  L0_1 = L0_2

  L0_2 = Config

  L0_2 = L0_2.TrackerCloths

  if L0_2 then

    L0_2 = Config

    L0_2 = L0_2.TrackerCloths

    L0_2 = L0_2.enabled

    if L0_2 then

      L0_2 = SetPedComponentVariation

      L1_2 = PlayerPedId

      L1_2 = L1_2()

      L2_2 = 7

      L3_2 = 0

      L4_2 = 0

      L5_2 = 0

      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)

    end

  end

end

RemoveTrackerObj = L1_1

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:anklecuff"

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L0_2 = FW_GetClosestPlayer

  L0_2, L1_2 = L0_2()

  L2_2 = PlayerPedId

  L2_2 = L2_2()

  if -1 ~= L0_2 and L1_2 <= 3.0 and L1_2 > 0 then

    L3_2 = TriggerServerEvent

    L4_2 = "origen_police:server:anklecuff"

    L5_2 = GetPlayerServerId

    L6_2 = L0_2

    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2)

    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    L3_2 = RequestAnimSet

    L4_2 = "move_ped_crouched"

    L3_2(L4_2)

    while true do

      L3_2 = HasAnimSetLoaded

      L4_2 = "move_ped_crouched"

      L3_2 = L3_2(L4_2)

      if L3_2 then

        break

      end

      L3_2 = Wait

      L4_2 = 10

      L3_2(L4_2)

    end

    L3_2 = SetPedMovementClipset

    L4_2 = L2_2

    L5_2 = "move_ped_crouched"

    L6_2 = 1.0

    L3_2(L4_2, L5_2, L6_2)

    L3_2 = SetPedStrafeClipset

    L4_2 = L2_2

    L5_2 = "move_ped_crouched_strafing"

    L3_2(L4_2, L5_2)

    L3_2 = Wait

    L4_2 = 400

    L3_2(L4_2)

    L3_2 = RequestAnimDict

    L4_2 = "mp_arresting"

    L3_2(L4_2)

    while true do

      L3_2 = HasAnimDictLoaded

      L4_2 = "mp_arresting"

      L3_2 = L3_2(L4_2)

      if L3_2 then

        break

      end

      L3_2 = Wait

      L4_2 = 1

      L3_2(L4_2)

    end

    L3_2 = TaskPlayAnim

    L4_2 = PlayerPedId

    L4_2 = L4_2()

    L5_2 = "mp_arresting"

    L6_2 = "a_uncuff"

    L7_2 = 8.0

    L8_2 = -8.0

    L9_2 = -1

    L10_2 = 16

    L11_2 = 0

    L12_2 = 0

    L13_2 = 0

    L14_2 = 0

    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    L3_2 = Wait

    L4_2 = 5000

    L3_2(L4_2)

    L3_2 = ClearPedTasks

    L4_2 = L2_2

    L3_2(L4_2)

    L3_2 = SetPedStealthMovement

    L4_2 = L2_2

    L5_2 = false

    L6_2 = "DEFAULT_ACTION"

    L3_2(L4_2, L5_2, L6_2)

    L3_2 = ResetPedMovementClipset

    L4_2 = L2_2

    L5_2 = 1.0

    L3_2(L4_2, L5_2)

    L3_2 = ResetPedWeaponMovementClipset

    L4_2 = L2_2

    L3_2(L4_2)

    L3_2 = ResetPedStrafeClipset

    L4_2 = L2_2

    L3_2(L4_2)

  else

    L3_2 = ShowNotification

    L4_2 = Config

    L4_2 = L4_2.Translations

    L4_2 = L4_2.NoPersonNear

    L5_2 = "error"

    L3_2(L4_2, L5_2)

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetAnkleCuff"

function L3_1(A0_2)

  local L1_2

  if not A0_2 then

    L1_2 = RemoveTrackerObj

    L1_2()

    return

  end

  L1_2 = true

  L0_1 = L1_2

  L1_2 = AddTrackerObj

  L1_2()

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:ankleshock"

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L0_2 = "stungun@standing"

  L1_2 = RequestAnimDict

  L2_2 = L0_2

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = L0_2

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = RequestAnimDict

    L2_2 = L0_2

    L1_2(L2_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 0

    L1_2(L2_2)

  end

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = TaskPlayAnim

  L3_2 = L1_2

  L4_2 = L0_2

  L5_2 = "damage"

  L6_2 = 8.0

  L7_2 = 1.0

  L8_2 = 1500

  L9_2 = 1

  L10_2 = 0

  L11_2 = false

  L12_2 = false

  L13_2 = false

  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

  L2_2 = 0

  L3_2 = 15

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = SetEntityHealth

    L7_2 = L1_2

    L8_2 = GetEntityHealth

    L9_2 = L1_2

    L8_2 = L8_2(L9_2)

    L8_2 = L8_2 - 1

    L6_2(L7_2, L8_2)

    L6_2 = Citizen

    L6_2 = L6_2.Wait

    L7_2 = 100

    L6_2(L7_2)

  end

  L2_2 = SetPedToRagdoll

  L3_2 = L1_2

  L4_2 = 4000

  L5_2 = 4000

  L6_2 = 0

  L7_2 = 0

  L8_2 = 0

  L9_2 = 0

  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

end

L1_1(L2_1, L3_1)

