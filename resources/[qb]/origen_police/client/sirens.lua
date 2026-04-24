local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = Config

L0_1 = L0_1.SirensSystem

if not L0_1 then

  return

end

L0_1 = {}

L1_1 = RegisterCommand

L2_1 = Config

L2_1 = L2_1.Commands

L2_1 = L2_1.LightsSirens

L2_1 = L2_1.cmd

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = IsNuiFocused

  L0_2 = L0_2()

  if L0_2 then

    return

  end

  L0_2 = IsDisabledControlPressed

  L1_2 = 0

  L2_2 = 86

  L0_2 = L0_2(L1_2, L2_2)

  if L0_2 then

    return

  end

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = GetVehiclePedIsIn

  L2_2 = L0_2

  L3_2 = false

  L1_2 = L1_2(L2_2, L3_2)

  if 0 ~= L1_2 then

    L2_2 = ValidVehicles

    L2_2 = L2_2[L1_2]

    if true == L2_2 then

      L2_2 = SetVehicleSiren

      L3_2 = L1_2

      L4_2 = IsVehicleSirenOn

      L5_2 = L1_2

      L4_2 = L4_2(L5_2)

      L4_2 = not L4_2

      L2_2(L3_2, L4_2)

      L2_2 = SetVehicleHasMutedSirens

      L3_2 = L1_2

      L4_2 = true

      L2_2(L3_2, L4_2)

      L2_2 = TriggerServerEvent

      L3_2 = "origen_police:server:PoliceSirenState"

      L4_2 = NetworkGetNetworkIdFromEntity

      L5_2 = L1_2

      L4_2 = L4_2(L5_2)

      L5_2 = 0

      L2_2(L3_2, L4_2, L5_2)

    end

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterKeyMapping

L2_1 = Config

L2_1 = L2_1.Commands

L2_1 = L2_1.LightsSirens

L2_1 = L2_1.cmd

L3_1 = Config

L3_1 = L3_1.Commands

L3_1 = L3_1.LightsSirens

L3_1 = L3_1.description

L4_1 = "keyboard"

L5_1 = Config

L5_1 = L5_1.Commands

L5_1 = L5_1.LightsSirens

L5_1 = L5_1.key

L1_1(L2_1, L3_1, L4_1, L5_1)

L1_1 = RegisterCommand

L2_1 = Config

L2_1 = L2_1.Commands

L2_1 = L2_1.SirensKey

L2_1 = L2_1.cmd

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L0_2 = IsNuiFocused

  L0_2 = L0_2()

  if L0_2 then

    return

  end

  L0_2 = IsDisabledControlPressed

  L1_2 = 0

  L2_2 = 86

  L0_2 = L0_2(L1_2, L2_2)

  if L0_2 then

    return

  end

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = GetVehiclePedIsIn

  L2_2 = L0_2

  L3_2 = false

  L1_2 = L1_2(L2_2, L3_2)

  if 0 ~= L1_2 then

    L2_2 = IsVehicleSirenOn

    L3_2 = L1_2

    L2_2 = L2_2(L3_2)

    if L2_2 then

      L2_2 = ValidVehicles

      L2_2 = L2_2[L1_2]

      if true == L2_2 then

        L2_2 = NetworkGetNetworkIdFromEntity

        L3_2 = L1_2

        L2_2 = L2_2(L3_2)

        L3_2 = TriggerServerEvent

        L4_2 = "origen_police:server:PoliceSirenState"

        L5_2 = L2_2

        L6_2 = L0_1

        L6_2 = L6_2[L2_2]

        if not L6_2 then

          L6_2 = 1

          if L6_2 then

            goto lbl_52

          end

        end

        L6_2 = L0_1

        L6_2 = L6_2[L2_2]

        L6_2 = L6_2.siren

        if 0 == L6_2 then

          L6_2 = 1

          if L6_2 then

            goto lbl_52

          end

        end

        L6_2 = 0

        ::lbl_52::

        L3_2(L4_2, L5_2, L6_2)

      end

    end

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterKeyMapping

L2_1 = Config

L2_1 = L2_1.Commands

L2_1 = L2_1.SirensKey

L2_1 = L2_1.cmd

L3_1 = Config

L3_1 = L3_1.Commands

L3_1 = L3_1.SirensKey

L3_1 = L3_1.description

L4_1 = "keyboard"

L5_1 = Config

L5_1 = L5_1.Commands

L5_1 = L5_1.SirensKey

L5_1 = L5_1.key

L1_1(L2_1, L3_1, L4_1, L5_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:PoliceHornState"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = L0_1

  L2_2 = L2_2[A0_2]

  if not L2_2 then

    L2_2 = L0_1

    L3_2 = {}

    L3_2.horn = A1_2

    L2_2[A0_2] = L3_2

  else

    L2_2 = L0_1

    L2_2 = L2_2[A0_2]

    L2_2.horn = A1_2

  end

  L2_2 = L0_1

  L2_2 = L2_2[A0_2]

  L2_2.sync = true

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:PoliceSirenState"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = NetworkDoesNetworkIdExist

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if not L2_2 then

    return

  end

  L2_2 = NetworkGetEntityFromNetworkId

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L3_2 = SetVehicleHasMutedSirens

  L4_2 = L2_2

  L5_2 = true

  L3_2(L4_2, L5_2)

  L3_2 = L0_1

  L3_2 = L3_2[A0_2]

  if not L3_2 then

    L3_2 = L0_1

    L4_2 = {}

    L5_2 = A1_2 or L5_2

    if not A1_2 then

      L5_2 = 1

    end

    L4_2.siren = L5_2

    L3_2[A0_2] = L4_2

  else

    L3_2 = L0_1

    L3_2 = L3_2[A0_2]

    L4_2 = A1_2 or L4_2

    if not A1_2 then

      L4_2 = L0_1

      L4_2 = L4_2[A0_2]

      L4_2 = L4_2.siren

      if not L4_2 then

        L4_2 = 0

      end

      L4_2 = L4_2 + 1

    end

    L3_2.siren = L4_2

    L3_2 = L0_1

    L3_2 = L3_2[A0_2]

    L3_2 = L3_2.siren

    L4_2 = Config

    L4_2 = L4_2.Sirens

    L4_2 = #L4_2

    if L3_2 > L4_2 then

      L3_2 = L0_1

      L3_2 = L3_2[A0_2]

      L3_2.siren = 1

    end

  end

  L3_2 = L0_1

  L3_2 = L3_2[A0_2]

  L3_2.sync = true

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:clearcache"

function L3_1(A0_2)

  local L1_2, L2_2

  L1_2 = L0_1

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L1_2 = L0_1

    L1_2 = L1_2[A0_2]

    L1_2 = L1_2.hornid

    if L1_2 then

      L1_2 = ReleaseSoundId

      L2_2 = L0_1

      L2_2 = L2_2[A0_2]

      L2_2 = L2_2.hornid

      L1_2(L2_2)

    end

    L1_2 = L0_1

    L1_2 = L1_2[A0_2]

    L1_2 = L1_2.sirenid

    if L1_2 then

      L1_2 = ReleaseSoundId

      L2_2 = L0_1

      L2_2 = L2_2[A0_2]

      L2_2 = L2_2.sirenid

      L1_2(L2_2)

    end

    L1_2 = L0_1

    L1_2[A0_2] = nil

  end

end

L1_1(L2_1, L3_1)

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  while true do

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 0

    L0_2(L1_2)

    L0_2 = pairs

    L1_2 = L0_1

    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

      L6_2 = L5_2.sync

      if L6_2 then

        L6_2 = NetworkDoesNetworkIdExist

        L7_2 = L4_2

        L6_2 = L6_2(L7_2)

        if L6_2 then

          L6_2 = NetworkGetEntityFromNetworkId

          L7_2 = L4_2

          L6_2 = L6_2(L7_2)

          L7_2 = DoesEntityExist

          L8_2 = L6_2

          L7_2 = L7_2(L8_2)

          if L7_2 then

            L7_2 = StopSound

            L8_2 = L5_2.hornid

            L7_2(L8_2)

            L7_2 = ReleaseSoundId

            L8_2 = L5_2.hornid

            L7_2(L8_2)

            L7_2 = L5_2.horn

            if L7_2 then

              L7_2 = GetSoundId

              L7_2 = L7_2()

              L5_2.hornid = L7_2

              L7_2 = PlaySoundFromEntity

              L8_2 = L5_2.hornid

              L9_2 = "SIRENS_AIRHORN"

              L10_2 = L6_2

              L11_2 = 0

              L12_2 = 0

              L13_2 = 0

              L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

            else

              L7_2 = L5_2.hornid

              if L7_2 then

                L5_2.hornid = false

              end

            end

            L7_2 = L5_2.siren

            if L7_2 then

              L7_2 = L5_2.sirenid

              if L7_2 then

                L7_2 = StopSound

                L8_2 = L5_2.sirenid

                L7_2(L8_2)

                L7_2 = ReleaseSoundId

                L8_2 = L5_2.sirenid

                L7_2(L8_2)

                L5_2.sirenid = false

              end

              L7_2 = Config

              L7_2 = L7_2.Sirens

              L8_2 = L5_2.siren

              L7_2 = L7_2[L8_2]

              if L7_2 then

                L7_2 = GetSoundId

                L7_2 = L7_2()

                L5_2.sirenid = L7_2

                L7_2 = PlaySoundFromEntity

                L8_2 = L5_2.sirenid

                L9_2 = Config

                L9_2 = L9_2.Sirens

                L10_2 = L5_2.siren

                L9_2 = L9_2[L10_2]

                L10_2 = L6_2

                L11_2 = 0

                L12_2 = 0

                L13_2 = 0

                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

              end

            end

          else

            L7_2 = L5_2.sirenid

            if L7_2 then

              L7_2 = StopSound

              L8_2 = L5_2.sirenid

              L7_2(L8_2)

              L7_2 = ReleaseSoundId

              L8_2 = L5_2.sirenid

              L7_2(L8_2)

              L5_2.sirenid = false

            end

            L7_2 = L5_2.hornid

            if L7_2 then

              L7_2 = StopSound

              L8_2 = L5_2.hornid

              L7_2(L8_2)

              L7_2 = ReleaseSoundId

              L8_2 = L5_2.hornid

              L7_2(L8_2)

              L5_2.hornid = false

            end

          end

        end

        L5_2.sync = false

      end

    end

  end

end

L1_1(L2_1)

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  while true do

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 0

    L0_2(L1_2)

    L0_2 = GetVehiclePedIsIn

    L1_2 = PlayerPedId

    L1_2 = L1_2()

    L2_2 = false

    L0_2 = L0_2(L1_2, L2_2)

    if L0_2 > 0 then

      L1_2 = ValidVehicles

      L1_2 = L1_2[L0_2]

      if true == L1_2 then

        L1_2 = IsControlJustPressed

        L2_2 = 0

        L3_2 = 80

        L1_2 = L1_2(L2_2, L3_2)

        if not L1_2 then

          goto lbl_108

        end

        L1_2 = DisableControlAction

        L2_2 = 0

        L3_2 = 80

        L4_2 = true

        L1_2(L2_2, L3_2, L4_2)

        L1_2 = NetworkGetNetworkIdFromEntity

        L2_2 = L0_2

        L1_2 = L1_2(L2_2)

        L2_2 = IsVehicleSirenOn

        L3_2 = L0_2

        L2_2 = L2_2(L3_2)

        if L2_2 then

          L2_2 = L0_1

          L2_2 = L2_2[L1_2]

          if L2_2 then

            L2_2 = L0_1

            L2_2 = L2_2[L1_2]

            L2_2 = L2_2.siren

            if 0 ~= L2_2 then

              L2_2 = IsDisabledControlPressed

              L3_2 = 0

              L4_2 = 86

              L2_2 = L2_2(L3_2, L4_2)

              if not L2_2 then

                L2_2 = TriggerServerEvent

                L3_2 = "origen_police:server:PoliceSirenState"

                L4_2 = L1_2

                L2_2(L3_2, L4_2)

                while true do

                  L2_2 = IsDisabledControlPressed

                  L3_2 = 0

                  L4_2 = 80

                  L2_2 = L2_2(L3_2, L4_2)

                  if not L2_2 then

                    break

                  end

                  L2_2 = DisableControlAction

                  L3_2 = 0

                  L4_2 = 80

                  L5_2 = true

                  L2_2(L3_2, L4_2, L5_2)

                  L2_2 = Citizen

                  L2_2 = L2_2.Wait

                  L3_2 = 0

                  L2_2(L3_2)

                end

            end

          end

        end

        else

          L2_2 = IsDisabledControlPressed

          L3_2 = 0

          L4_2 = 86

          L2_2 = L2_2(L3_2, L4_2)

          if L2_2 then

            goto lbl_108

          end

          L2_2 = TriggerServerEvent

          L3_2 = "origen_police:server:PoliceSirenState"

          L4_2 = L1_2

          L5_2 = 1

          L2_2(L3_2, L4_2, L5_2)

          while true do

            L2_2 = IsDisabledControlPressed

            L3_2 = 0

            L4_2 = 80

            L2_2 = L2_2(L3_2, L4_2)

            if not L2_2 then

              break

            end

            L2_2 = DisableControlAction

            L3_2 = 0

            L4_2 = 80

            L5_2 = true

            L2_2(L3_2, L4_2, L5_2)

            L2_2 = Citizen

            L2_2 = L2_2.Wait

            L3_2 = 0

            L2_2(L3_2)

          end

          L2_2 = TriggerServerEvent

          L3_2 = "origen_police:server:PoliceSirenState"

          L4_2 = L1_2

          L5_2 = 0

          L2_2(L3_2, L4_2, L5_2)

        end

    end

    else

      L1_2 = Citizen

      L1_2 = L1_2.Wait

      L2_2 = 1000

      L1_2(L2_2)

    end

    ::lbl_108::

  end

end

L1_1(L2_1)

