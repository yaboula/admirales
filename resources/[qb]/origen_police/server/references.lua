local L0_1, L1_1, L2_1

L0_1 = {}

References = L0_1

L0_1 = {}

HiddenGpsCops = L0_1

L0_1 = Citizen

L0_1 = L0_1.CreateThread

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  while true do

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 2500

    L0_2(L1_2)

    L0_2 = References

    if nil == L0_2 then

      L0_2 = print

      L1_2 = "References has been breaked into a nil value, recreating it"

      L0_2(L1_2)

      L0_2 = {}

      References = L0_2

    else

      L0_2 = pairs

      L1_2 = References

      L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

      for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

        L6_2 = pairs

        L7_2 = L5_2

        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

          L12_2 = GetEntityCoords

          L13_2 = GetPlayerPed

          L14_2 = L10_2

          L13_2, L14_2 = L13_2(L14_2)

          L12_2 = L12_2(L13_2, L14_2)

          L11_2.coords = L12_2

        end

      end

      L0_2 = GlobalState

      L1_2 = References

      L0_2.References = L1_2

    end

  end

end

L0_1(L1_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:updateref"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  if A1_2 then

    L2_2 = 1

    L3_2 = #A1_2

    L4_2 = 1

    for L5_2 = L2_2, L3_2, L4_2 do

      L6_2 = UpdateRef

      L7_2 = A1_2[L5_2]

      L8_2 = A0_2

      L6_2(L7_2, L8_2)

      L6_2 = A1_2[L5_2]

      L7_2 = source

      if L6_2 ~= L7_2 then

        L6_2 = TriggerClientEvent

        L7_2 = "origen_police:client:SyncQuick"

        L8_2 = A1_2[L5_2]

        L9_2 = A0_2

        L6_2(L7_2, L8_2, L9_2)

      end

    end

  else

    L2_2 = UpdateRef

    L3_2 = A0_2.source

    if not L3_2 then

      L3_2 = source

    end

    L4_2 = A0_2

    L2_2(L3_2, L4_2)

  end

end

L0_1(L1_1, L2_1)

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if L2_2 then

    L3_2 = L2_2.PlayerData

    if L3_2 then

      L3_2 = L2_2.PlayerData

      L3_2 = L3_2.job

      if L3_2 then

        goto lbl_14

      end

    end

  end

  do return end

  ::lbl_14::

  L3_2 = CanOpenTablet

  L4_2 = L2_2.PlayerData

  L4_2 = L4_2.job

  L4_2 = L4_2.name

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[2]

  L4_2 = References

  L5_2 = References

  L5_2 = L5_2[L3_2]

  if not L5_2 then

    L5_2 = {}

  end

  L4_2[L3_2] = L5_2

  L4_2 = References

  L4_2 = L4_2[L3_2]

  L4_2 = L4_2[A0_2]

  if not L4_2 then

    if L2_2 then

      L4_2 = L2_2.PlayerData

      if L4_2 then

        L4_2 = References

        L4_2 = L4_2[L3_2]

        L5_2 = {}

        L6_2 = L2_2.PlayerData

        L6_2 = L6_2.charinfo

        L6_2 = L6_2.lastname

        L5_2.lastname = L6_2

        L5_2.unit = "Sin Asignar"

        L5_2.jobCategory = L3_2

        L4_2[A0_2] = L5_2

      end

    end

  else

    L4_2 = References

    L4_2 = L4_2[L3_2]

    L4_2 = L4_2[A0_2]

    L4_2.sync = true

  end

  L4_2 = A1_2.unit

  if L4_2 then

    L4_2 = References

    L4_2 = L4_2[L3_2]

    L4_2 = L4_2[A0_2]

    L5_2 = A1_2.unit

    L4_2.unit = L5_2

  end

  L4_2 = A1_2.sprite

  if L4_2 then

    L4_2 = References

    L4_2 = L4_2[L3_2]

    L4_2 = L4_2[A0_2]

    L5_2 = A1_2.sprite

    L4_2.sprite = L5_2

  end

  L4_2 = A1_2.color

  if L4_2 then

    L4_2 = References

    L4_2 = L4_2[L3_2]

    L4_2 = L4_2[A0_2]

    L5_2 = A1_2.color

    L4_2.color = L5_2

  end

  L4_2 = A1_2.hideGPS

  if L4_2 then

    L4_2 = References

    L4_2 = L4_2[L3_2]

    L4_2 = L4_2[A0_2]

    L5_2 = A1_2.hideGPS

    L4_2.hideGPS = L5_2

  end

end

UpdateRef = L0_1

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:removeref"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L1_2 = A0_2 or nil

  if not A0_2 then

    L1_2 = source

  end

  L2_2 = FW_GetPlayer

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  if L2_2 then

    L3_2 = L2_2.PlayerData

    if L3_2 then

      L3_2 = L2_2.PlayerData

      L3_2 = L3_2.job

      if L3_2 then

        goto lbl_17

      end

    end

  end

  do return end

  ::lbl_17::

  L3_2 = CanOpenTablet

  L4_2 = L2_2.PlayerData

  L4_2 = L4_2.job

  L4_2 = L4_2.name

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[2]

  if not L3_2 then

    return

  end

  L4_2 = References

  L5_2 = References

  L5_2 = L5_2[L3_2]

  if not L5_2 then

    L5_2 = {}

  end

  L4_2[L3_2] = L5_2

  L4_2 = pairs

  L5_2 = References

  L5_2 = L5_2[L3_2]

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = TriggerClientEvent

    L11_2 = "origen_police:client:removeref"

    L12_2 = L8_2

    L13_2 = L1_2

    L14_2 = L8_2 == L1_2

    L10_2(L11_2, L12_2, L13_2, L14_2)

  end

  L4_2 = References

  L4_2 = L4_2[L3_2]

  L4_2[L1_2] = nil

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:setLocation"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = source

  L2_2 = CanOpenTablet

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = HiddenGpsCops

  L4_2 = not A0_2

  L3_2[L1_2] = L4_2

  L3_2 = pairs

  L4_2 = Cops

  L4_2 = L4_2[L2_2]

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2.source

    if L9_2 == L1_2 then

      L9_2 = not A0_2

      L8_2.hideGPS = L9_2

      break

    end

  end

  L3_2 = References

  L4_2 = References

  L4_2 = L4_2[L2_2]

  if not L4_2 then

    L4_2 = {}

  end

  L3_2[L2_2] = L4_2

  L3_2 = References

  L3_2 = L3_2[L2_2]

  L3_2 = L3_2[L1_2]

  if L3_2 then

    L3_2 = References

    L3_2 = L3_2[L2_2]

    L3_2 = L3_2[L1_2]

    L4_2 = not A0_2

    L3_2.hideGPS = L4_2

    L3_2 = UpdateRef

    L4_2 = L1_2

    L5_2 = {}

    L6_2 = not A0_2

    L5_2.hideGPS = L6_2

    L3_2(L4_2, L5_2)

  end

end

L0_1(L1_1, L2_1)

