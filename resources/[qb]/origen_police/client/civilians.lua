local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1

L0_1 = {}

L1_1 = false

L2_1 = false

L3_1 = {}

L4_1 = Citizen

L4_1 = L4_1.CreateThread

function L5_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2

  L0_2 = Public

  L0_2 = L0_2.Blips

  if L0_2 then

    L0_2 = pairs

    L1_2 = Public

    L1_2 = L1_2.Blips

    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

      L6_2 = AddBlipForCoord

      L7_2 = L5_2.coords

      L7_2 = L7_2.xyz

      L6_2 = L6_2(L7_2)

      L7_2 = SetBlipSprite

      L8_2 = L6_2

      L9_2 = L5_2.sprite

      if not L9_2 then

        L9_2 = 1

      end

      L7_2(L8_2, L9_2)

      L7_2 = SetBlipColour

      L8_2 = L6_2

      L9_2 = L5_2.color

      if not L9_2 then

        L9_2 = 0

      end

      L7_2(L8_2, L9_2)

      L7_2 = SetBlipScale

      L8_2 = L6_2

      L9_2 = L5_2.size

      if not L9_2 then

        L9_2 = 0.8

      end

      L7_2(L8_2, L9_2)

      L7_2 = SetBlipAsShortRange

      L8_2 = L6_2

      L9_2 = true

      L7_2(L8_2, L9_2)

      L7_2 = BeginTextCommandSetBlipName

      L8_2 = "STRING"

      L7_2(L8_2)

      L7_2 = AddTextComponentSubstringPlayerName

      L8_2 = L5_2.name

      L7_2(L8_2)

      L7_2 = EndTextCommandSetBlipName

      L8_2 = L6_2

      L7_2(L8_2)

    end

  end

  L0_2 = Citizen

  L0_2 = L0_2.CreateThread

  function L1_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3

    L0_3 = Public

    L0_3 = L0_3.TrafficZones

    if L0_3 then

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = 5000

      L0_3(L1_3)

      L0_3 = 1

      L1_3 = Public

      L1_3 = L1_3.TrafficZones

      L1_3 = #L1_3

      L2_3 = 1

      for L3_3 = L0_3, L1_3, L2_3 do

        L4_3 = onduty

        if L4_3 then

          L4_3 = Public

          L4_3 = L4_3.TrafficZones

          L4_3 = L4_3[L3_3]

          L5_3 = AddBlipForRadius

          L6_3 = Public

          L6_3 = L6_3.TrafficZones

          L6_3 = L6_3[L3_3]

          L6_3 = L6_3.coords

          L7_3 = 50.0

          L5_3 = L5_3(L6_3, L7_3)

          L4_3.blip = L5_3

          L4_3 = SetBlipAlpha

          L5_3 = Public

          L5_3 = L5_3.TrafficZones

          L5_3 = L5_3[L3_3]

          L5_3 = L5_3.coords

          L6_3 = 100

          L4_3(L5_3, L6_3)

        end

        L4_3 = Public

        L4_3 = L4_3.TrafficZones

        L4_3 = L4_3[L3_3]

        L4_3 = L4_3.type

        if "stop" == L4_3 then

          L4_3 = Public

          L4_3 = L4_3.TrafficZones

          L4_3 = L4_3[L3_3]

          L5_3 = AddRoadNodeSpeedZone

          L6_3 = Public

          L6_3 = L6_3.TrafficZones

          L6_3 = L6_3[L3_3]

          L6_3 = L6_3.coords

          L7_3 = 50.0

          L8_3 = 0.0

          L9_3 = false

          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3)

          L4_3.id = L5_3

          L4_3 = Public

          L4_3 = L4_3.TrafficZones

          L4_3 = L4_3[L3_3]

          L4_3 = L4_3.blip

          if L4_3 then

            L4_3 = SetBlipColour

            L5_3 = Public

            L5_3 = L5_3.TrafficZones

            L5_3 = L5_3[L3_3]

            L5_3 = L5_3.blip

            L6_3 = 6

            L4_3(L5_3, L6_3)

          end

        else

          L4_3 = Public

          L4_3 = L4_3.TrafficZones

          L4_3 = L4_3[L3_3]

          L4_3 = L4_3.type

          if "slow" == L4_3 then

            L4_3 = Public

            L4_3 = L4_3.TrafficZones

            L4_3 = L4_3[L3_3]

            L5_3 = AddRoadNodeSpeedZone

            L6_3 = Public

            L6_3 = L6_3.TrafficZones

            L6_3 = L6_3[L3_3]

            L6_3 = L6_3.coords

            L7_3 = 50.0

            L8_3 = 5.0

            L9_3 = false

            L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3)

            L4_3.id = L5_3

            L4_3 = Public

            L4_3 = L4_3.TrafficZones

            L4_3 = L4_3[L3_3]

            L4_3 = L4_3.blip

            if L4_3 then

              L4_3 = SetBlipColour

              L5_3 = Public

              L5_3 = L5_3.TrafficZones

              L5_3 = L5_3[L3_3]

              L5_3 = L5_3.blip

              L6_3 = 44

              L4_3(L5_3, L6_3)

            end

          end

        end

      end

    end

  end

  L0_2(L1_2)

  while true do

    L0_2 = 2000

    L1_2 = PlayerPedId

    L1_2 = L1_2()

    L2_2 = GetEntityCoords

    L3_2 = L1_2

    L2_2 = L2_2(L3_2)

    L3_2 = Public

    L3_2 = L3_2.Markers

    if L3_2 then

      L3_2 = 1

      L4_2 = Public

      L4_2 = L4_2.Markers

      L4_2 = #L4_2

      L5_2 = 1

      for L6_2 = L3_2, L4_2, L5_2 do

        L7_2 = Public

        L7_2 = L7_2.Markers

        L7_2 = L7_2[L6_2]

        L8_2 = L7_2.coords

        L8_2 = L8_2.xyz

        L8_2 = L2_2 - L8_2

        L8_2 = #L8_2

        if L8_2 < 30 then

          L0_2 = 0

          L9_2 = Config

          L9_2 = L9_2.MarkersDraw

          if L9_2 then

            L9_2 = DrawMarker

            L10_2 = L7_2.sprite

            L11_2 = L7_2.coords

            L11_2 = L11_2.x

            L12_2 = L7_2.coords

            L12_2 = L12_2.y

            L13_2 = L7_2.coords

            L13_2 = L13_2.z

            L14_2 = 0.0

            L15_2 = 0.0

            L16_2 = 0.0

            L17_2 = 0.0

            L18_2 = 0.0

            L19_2 = 0.0

            L20_2 = 0.3

            L21_2 = 0.3

            L22_2 = 0.3

            L23_2 = L7_2.rgba

            L23_2 = L23_2.r

            L24_2 = L7_2.rgba

            L24_2 = L24_2.g

            L25_2 = L7_2.rgba

            L25_2 = L25_2.b

            L26_2 = L7_2.rgba

            L26_2 = L26_2.a

            L27_2 = false

            L28_2 = false

            L29_2 = 0

            L30_2 = true

            L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)

          end

          L9_2 = L7_2.radius

          if not L9_2 then

            L9_2 = 1

          end

          if L8_2 < L9_2 then

            L9_2 = Config

            L9_2 = L9_2.CustomNotify

            if L9_2 then

              L9_2 = ShowHelpNotification

              L10_2 = "E"

              L11_2 = L7_2.text

              L9_2(L10_2, L11_2)

              L7_2.noty = true

            else

              L9_2 = Config

              L9_2 = L9_2.Framework

              if "qbcore" == L9_2 then

                L9_2 = L7_2.noty

                if not L9_2 then

                  L9_2 = exports

                  L9_2 = L9_2["qb-core"]

                  L10_2 = L9_2

                  L9_2 = L9_2.DrawText

                  L11_2 = "[E] "

                  L12_2 = L7_2.text

                  L11_2 = L11_2 .. L12_2

                  L12_2 = "left"

                  L9_2(L10_2, L11_2, L12_2)

                  L7_2.noty = true

                end

              else

                L9_2 = Config

                L9_2 = L9_2.Framework

                if "esx" == L9_2 then

                  L9_2 = Framework

                  L9_2 = L9_2.ShowHelpNotification

                  L10_2 = "~INPUT_PICKUP~ "

                  L11_2 = L7_2.text

                  L10_2 = L10_2 .. L11_2

                  L11_2 = true

                  L9_2(L10_2, L11_2)

                end

              end

            end

            L9_2 = IsControlJustPressed

            L10_2 = 0

            L11_2 = 38

            L9_2 = L9_2(L10_2, L11_2)

            if L9_2 then

              L9_2 = TriggerEvent

              L10_2 = L7_2.event

              L11_2 = L6_2

              L12_2 = L7_2.station

              L9_2(L10_2, L11_2, L12_2)

            end

          else

            L9_2 = L7_2.noty

            if L9_2 then

              L9_2 = HideHelpNotification

              L9_2()

              L7_2.noty = nil

            end

          end

        else

          L9_2 = L7_2.noty

          if L9_2 then

            L9_2 = HideHelpNotification

            L9_2()

            L7_2.noty = nil

          end

        end

      end

    end

    L3_2 = Citizen

    L3_2 = L3_2.Wait

    L4_2 = L0_2

    L3_2(L4_2)

  end

end

L4_1(L5_1)

function L4_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = GetEntityCoords

  L1_2 = PlayerPedId

  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L1_2()

  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)

  L1_2 = 1

  L2_2 = Config

  L2_2 = L2_2.RestrictedAlertZones

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = isInside

    L6_2 = Config

    L6_2 = L6_2.RestrictedAlertZones

    L6_2 = L6_2[L4_2]

    L7_2 = L0_2.x

    L8_2 = L0_2.y

    L5_2 = L5_2(L6_2, L7_2, L8_2)

    if L5_2 then

      L5_2 = true

      return L5_2

    end

  end

  L1_2 = false

  return L1_2

end

L5_1 = Citizen

L5_1 = L5_1.CreateThread

function L6_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  while true do

    L0_2 = 500

    L1_2 = PlayerPedId

    L1_2 = L1_2()

    L2_2 = GetEntityCoords

    L3_2 = L1_2

    L2_2 = L2_2(L3_2)

    L3_2 = L4_1

    L3_2 = L3_2()

    if L3_2 then

    else

      L3_2 = IsPlayerFreeAiming

      L4_2 = PlayerId

      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

      if not L3_2 then

        L3_2 = GetPedConfigFlag

        L4_2 = L1_2

        L5_2 = 78

        L3_2 = L3_2(L4_2, L5_2)

        if not L3_2 then

          -- [INST INST-028 RAC-002] 'goto lbl_132' eliminado (label en scope inválido).
          -- Semántica: peds con flag 78 (invisibles/ocultos) no acumulan evidence en ese tick.
          -- Degradación mínima aceptable vs crash del parser que impedía cargar TODA la detección.

        end

      end

      L0_2 = 0

      L3_2 = IsPedShooting

      L4_2 = L1_2

      L3_2 = L3_2(L4_2)

      if L3_2 then

        L3_2 = GetScreenCoords

        L3_2, L4_2, L5_2 = L3_2()

        if L3_2 then

          L6_2 = GetItemFromWeapon

          L7_2 = FW_GetPlayerData

          L8_2 = false

          L7_2 = L7_2(L8_2)

          L8_2 = GetSelectedPedWeapon

          L9_2 = L1_2

          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2)

          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

          L0_1 = L6_2

          L6_2 = L0_1

          if not L6_2 then

            L6_2 = Debuger

            L7_2 = "Can't find weapon data in the inventory, weapon: "

            L8_2 = GetSelectedPedWeapon

            L9_2 = L1_2

            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2)

            L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

          else

            L6_2 = Config

            L6_2 = L6_2.EvidenceSystem

            if L6_2 then

              L6_2 = L0_1

              if L6_2 then

                L6_2 = L0_1.slot

                if L6_2 then

                  L6_2 = table

                  L6_2 = L6_2.insert

                  L7_2 = L3_1

                  L8_2 = {}

                  L8_2.type = "Shoot"

                  L8_2.coords = L2_2

                  L9_2 = L0_1.slot

                  L8_2.wp = L9_2

                  L6_2(L7_2, L8_2)

                  L6_2 = DoesEntityExist

                  L7_2 = L5_2

                  L6_2 = L6_2(L7_2)

                  if L6_2 then

                    L6_2 = IsEntityPositionFrozen

                    L7_2 = L5_2

                    L6_2 = L6_2(L7_2)

                    if not L6_2 then

                      if not L5_2 then

                        goto lbl_124

                      end

                      L6_2 = IsEntityAPed

                      L7_2 = L5_2

                      L6_2 = L6_2(L7_2)

                      if not L6_2 then

                        goto lbl_124

                      end

                      L6_2 = IsPedAPlayer

                      L7_2 = L5_2

                      L6_2 = L6_2(L7_2)

                      if L6_2 then

                        goto lbl_124

                      end

                      L6_2 = table

                      L6_2 = L6_2.insert

                      L7_2 = L3_1

                      L8_2 = {}

                      L8_2.type = "NpcBlood"

                      L8_2.coords = L4_2

                      L9_2 = IsPedHuman

                      L10_2 = L5_2

                      L9_2 = L9_2(L10_2)

                      if L9_2 then

                        L9_2 = "Generate"

                        if L9_2 then

                          goto lbl_111

                        end

                      end

                      L9_2 = "Animal"

                      ::lbl_111::

                      L8_2.adn = L9_2

                      L6_2(L7_2, L8_2)

                  end

                  else

                    L6_2 = table

                    L6_2 = L6_2.insert

                    L7_2 = L3_1

                    L8_2 = {}

                    L8_2.type = "Impact"

                    L8_2.coords = L4_2

                    L9_2 = L0_1.slot

                    L8_2.wp = L9_2

                    L6_2(L7_2, L8_2)

                  end

                end

              end

            end

            ::lbl_124::

            L6_2 = Config

            L6_2 = L6_2.ShootAlert

            if L6_2 then

              L6_2 = SendShootAlert

              L7_2 = L0_1

              L6_2(L7_2)

              goto lbl_213

              ::lbl_132::

              L3_2 = L3_1

              L3_2 = #L3_2

              if L3_2 > 0 then

                L3_2 = Config

                L3_2 = L3_2.EvidenceSystem

                if L3_2 then

                  L3_2 = {}

                  L4_2 = 1

                  L5_2 = L3_1

                  L5_2 = #L5_2

                  L6_2 = 1

                  for L7_2 = L4_2, L5_2, L6_2 do

                    L8_2 = false

                    L9_2 = 1

                    L10_2 = #L3_2

                    L11_2 = 1

                    for L12_2 = L9_2, L10_2, L11_2 do

                      L13_2 = L3_2[L12_2]

                      L13_2 = L13_2.coords

                      L14_2 = L3_1

                      L14_2 = L14_2[L7_2]

                      L14_2 = L14_2.coords

                      L13_2 = L13_2 - L14_2

                      L13_2 = #L13_2

                      L14_2 = 1.1

                      if L13_2 < L14_2 then

                        L13_2 = L3_2[L12_2]

                        L13_2 = L13_2.type

                        L14_2 = L3_1

                        L14_2 = L14_2[L7_2]

                        L14_2 = L14_2.type

                        if L13_2 == L14_2 then

                          L13_2 = L3_1

                          L13_2 = L13_2[L7_2]

                          L13_2 = L13_2.npc

                          if L13_2 then

                            L13_2 = L3_2[L12_2]

                            L13_2 = L13_2.npc

                            if L13_2 then

                              L13_2 = L3_1

                              L13_2 = L13_2[L7_2]

                              L13_2 = L13_2.npc

                              L14_2 = L3_2[L12_2]

                              L14_2 = L14_2.npc

                              if L13_2 ~= L14_2 then

                              end

                            end

                          end

                          L13_2 = L3_2[L12_2]

                          L14_2 = L3_2[L12_2]

                          L14_2 = L14_2.count

                          if not L14_2 then

                            L14_2 = 1

                          end

                          L14_2 = L14_2 + 1

                          L13_2.count = L14_2

                          L8_2 = true

                        end

                      end

                    end

                    if not L8_2 then

                      L9_2 = table

                      L9_2 = L9_2.insert

                      L10_2 = L3_2

                      L11_2 = L3_1

                      L11_2 = L11_2[L7_2]

                      L9_2(L10_2, L11_2)

                    end

                  end

                  L4_2 = TriggerServerEvent

                  L5_2 = "origen_police:server:AddNewEvidence"

                  L6_2 = L3_2

                  L4_2(L5_2, L6_2)

                  L4_2 = {}

                  L3_1 = L4_2

                end

              end

            end

          end

        end

      end

      ::lbl_213::

      L3_2 = Config

      L3_2 = L3_2.EvidenceSystem

      if L3_2 then

        L3_2 = GetVehiclePedIsIn

        L4_2 = L1_2

        L5_2 = false

        L3_2 = L3_2(L4_2, L5_2)

        if 0 ~= L3_2 then

          L4_2 = GetPedInVehicleSeat

          L5_2 = L3_2

          L6_2 = -1

          L4_2 = L4_2(L5_2, L6_2)

          L5_2 = PlayerPedId

          L5_2 = L5_2()

          if L4_2 == L5_2 then

            L4_2 = L2_1

            if L4_2 then

              L4_2 = L2_1

              L5_2 = GetVehicleBodyHealth

              L6_2 = L3_2

              L5_2 = L5_2(L6_2)

              L4_2 = L4_2 - L5_2

              if L4_2 > 5 then

                L4_2 = TriggerServerEvent

                L5_2 = "origen_police:server:AddNewEvidence"

                L6_2 = {}

                L6_2.type = "VehCrash"

                L7_2 = Config

                L7_2 = L7_2.CustomCarLabels

                L8_2 = GetEntityModel

                L9_2 = L3_2

                L8_2 = L8_2(L9_2)

                L7_2 = L7_2[L8_2]

                if L7_2 then

                  L7_2 = Config

                  L7_2 = L7_2.CustomCarLabels

                  L8_2 = GetEntityModel

                  L9_2 = L3_2

                  L8_2 = L8_2(L9_2)

                  L7_2 = L7_2[L8_2]

                  if L7_2 then

                    goto lbl_270

                  end

                end

                L7_2 = GetLabelText

                L8_2 = GetDisplayNameFromVehicleModel

                L9_2 = GetEntityModel

                L10_2 = L3_2

                L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2)

                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

                ::lbl_270::

                L6_2.model = L7_2

                L7_2 = {}

                L8_2 = GetVehicleColor

                L9_2 = L3_2

                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2)

                L7_2[1] = L8_2

                L7_2[2] = L9_2

                L7_2[3] = L10_2

                L7_2[4] = L11_2

                L7_2[5] = L12_2

                L7_2[6] = L13_2

                L7_2[7] = L14_2

                L6_2.color = L7_2

                L7_2 = GetEntityCoords

                L8_2 = L3_2

                L7_2 = L7_2(L8_2)

                L6_2.coords = L7_2

                L4_2(L5_2, L6_2)

              end

            end

            L4_2 = GetVehicleBodyHealth

            L5_2 = L3_2

            L4_2 = L4_2(L5_2)

            L2_1 = L4_2

        end

        elseif 0 == L3_2 then

          L4_2 = L1_1

          if L4_2 then

            L4_2 = L1_1

            L5_2 = GetEntityHealth

            L6_2 = L1_2

            L5_2 = L5_2(L6_2)

            L4_2 = L4_2 - L5_2

            if L4_2 > 6 then

              L4_2 = TriggerServerEvent

              L5_2 = "origen_police:server:AddNewEvidence"

              L6_2 = {}

              L6_2.type = "BloodRest"

              L6_2.adn = true

              L7_2 = GetSelfBloodType

              L7_2 = L7_2()

              L6_2.bloodType = L7_2

              L7_2 = GetEntityCoords

              L8_2 = L1_2

              L7_2 = L7_2(L8_2)

              L6_2.coords = L7_2

              L4_2(L5_2, L6_2)

            end

          end

          L4_2 = GetEntityHealth

          L5_2 = L1_2

          L4_2 = L4_2(L5_2)

          L1_1 = L4_2

          L4_2 = false

          L2_1 = L4_2

        end

      end

    end

    L3_2 = Citizen

    L3_2 = L3_2.Wait

    L4_2 = L0_2

    L3_2(L4_2)

  end

end

L5_1(L6_1)

L5_1 = Citizen

L5_1 = L5_1.CreateThread

function L6_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L0_2 = false

  while true do

    L1_2 = Public

    L1_2 = L1_2.Radars

    if L1_2 then

      L1_2 = Public

      L1_2 = L1_2.Radars

      L1_2 = #L1_2

      if 0 ~= L1_2 then

        break

      end

    end

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 5000

    L1_2(L2_2)

  end

  while true do

    L1_2 = 1500

    L2_2 = GetVehiclePedIsIn

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = false

    L2_2 = L2_2(L3_2, L4_2)

    L3_2 = Public

    L3_2 = L3_2.Radars

    L3_2 = #L3_2

    if L3_2 > 0 and 0 ~= L2_2 then

      L3_2 = GetPedInVehicleSeat

      L4_2 = L2_2

      L5_2 = -1

      L3_2 = L3_2(L4_2, L5_2)

      L4_2 = PlayerPedId

      L4_2 = L4_2()

      if L3_2 == L4_2 then

        L3_2 = GetEntityCoords

        L4_2 = L2_2

        L3_2 = L3_2(L4_2)

        L1_2 = 150

        if not L0_2 then

          L4_2 = 1

          L5_2 = Public

          L5_2 = L5_2.Radars

          L5_2 = #L5_2

          L6_2 = 1

          for L7_2 = L4_2, L5_2, L6_2 do

            L8_2 = Public

            L8_2 = L8_2.Radars

            L8_2 = L8_2[L7_2]

            L8_2 = L8_2.coords

            L8_2 = L3_2 - L8_2

            L8_2 = #L8_2

            if L8_2 < 22 then

              L8_2 = Public

              L8_2 = L8_2.Radars

              L8_2 = L8_2[L7_2]

              L0_2 = L8_2.coords

              L8_2 = Public

              L8_2 = L8_2.Radars

              L8_2 = L8_2[L7_2]

              L8_2 = L8_2.type

              if 1 == L8_2 then

                L8_2 = Config

                L8_2 = L8_2.SpeedType

                if "kmh" == L8_2 then

                  L8_2 = 3.6

                  if L8_2 then

                    goto lbl_76

                  end

                end

                L8_2 = 2.23694

                ::lbl_76::

                L9_2 = GetEntitySpeed

                L10_2 = L2_2

                L9_2 = L9_2(L10_2)

                L9_2 = L9_2 * L8_2

                L10_2 = Public

                L10_2 = L10_2.Radars

                L10_2 = L10_2[L7_2]

                L10_2 = L10_2.value

                if L9_2 > L10_2 then

                  L10_2 = GetVehicleClass

                  L11_2 = L2_2

                  L10_2 = L10_2(L11_2)

                  if 18 ~= L10_2 then

                    L10_2 = FW_Round

                    L11_2 = L9_2

                    L10_2 = L10_2(L11_2)

                    L9_2 = L10_2

                    L10_2 = TriggerServerEvent

                    L11_2 = "SendAlert:police"

                    L12_2 = {}

                    L13_2 = Public

                    L13_2 = L13_2.Radars

                    L13_2 = L13_2[L7_2]

                    L13_2 = L13_2.coords

                    L12_2.coords = L13_2

                    L13_2 = Config

                    L13_2 = L13_2.Translations

                    L13_2 = L13_2.Speeding

                    L12_2.title = L13_2

                    L12_2.type = "RADARES"

                    L13_2 = {}

                    L14_2 = GetLabelText

                    L15_2 = GetDisplayNameFromVehicleModel

                    L16_2 = GetEntityModel

                    L17_2 = L2_2

                    L16_2, L17_2 = L16_2(L17_2)

                    L15_2, L16_2, L17_2 = L15_2(L16_2, L17_2)

                    L14_2 = L14_2(L15_2, L16_2, L17_2)

                    L13_2.model = L14_2

                    L14_2 = {}

                    L15_2 = GetVehicleColor

                    L16_2 = L2_2

                    L15_2, L16_2, L17_2 = L15_2(L16_2)

                    L14_2[1] = L15_2

                    L14_2[2] = L16_2

                    L14_2[3] = L17_2

                    L13_2.color = L14_2

                    L14_2 = GetVehiclePlate

                    L15_2 = L2_2

                    L14_2 = L14_2(L15_2)

                    L13_2.plate = L14_2

                    L14_2 = L9_2

                    L15_2 = " kmh / ^"

                    L16_2 = Public

                    L16_2 = L16_2.Radars

                    L16_2 = L16_2[L7_2]

                    L16_2 = L16_2.value

                    L16_2 = L9_2 - L16_2

                    L17_2 = " kmh"

                    L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2

                    L13_2.speed = L14_2

                    L12_2.metadata = L13_2

                    L13_2 = Config

                    L13_2 = L13_2.PoliceJobCategory

                    L12_2.job = L13_2

                    L12_2.ignoreCooldown = true

                    L10_2(L11_2, L12_2)

                    L10_2 = SendNUIMessage

                    L11_2 = {}

                    L11_2.action = "RadarFlash"

                    L10_2(L11_2)

                  end

                end

              else

                L8_2 = Public

                L8_2 = L8_2.Radars

                L8_2 = L8_2[L7_2]

                L8_2 = L8_2.type

                if 2 == L8_2 then

                  L8_2 = GetVehiclePlate

                  L9_2 = L2_2

                  L8_2 = L8_2(L9_2)

                  L9_2 = L8_2

                  L8_2 = L8_2.find

                  L10_2 = Public

                  L10_2 = L10_2.Radars

                  L10_2 = L10_2[L7_2]

                  L10_2 = L10_2.value

                  L8_2 = L8_2(L9_2, L10_2)

                  if L8_2 then

                    L8_2 = TriggerServerEvent

                    L9_2 = "SendAlert:police"

                    L10_2 = {}

                    L11_2 = Public

                    L11_2 = L11_2.Radars

                    L11_2 = L11_2[L7_2]

                    L11_2 = L11_2.coords

                    L10_2.coords = L11_2

                    L11_2 = Config

                    L11_2 = L11_2.Translations

                    L11_2 = L11_2.PlateCod9

                    L10_2.title = L11_2

                    L10_2.type = "RADARES"

                    L11_2 = {}

                    L12_2 = GetLabelText

                    L13_2 = GetDisplayNameFromVehicleModel

                    L14_2 = GetEntityModel

                    L15_2 = L2_2

                    L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)

                    L13_2, L14_2, L15_2, L16_2, L17_2 = L13_2(L14_2, L15_2, L16_2, L17_2)

                    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)

                    L11_2.model = L12_2

                    L12_2 = {}

                    L13_2 = GetVehicleColor

                    L14_2 = L2_2

                    L13_2, L14_2, L15_2, L16_2, L17_2 = L13_2(L14_2)

                    L12_2[1] = L13_2

                    L12_2[2] = L14_2

                    L12_2[3] = L15_2

                    L12_2[4] = L16_2

                    L12_2[5] = L17_2

                    L11_2.color = L12_2

                    L12_2 = GetVehiclePlate

                    L13_2 = L2_2

                    L12_2 = L12_2(L13_2)

                    L11_2.plate = L12_2

                    L10_2.metadata = L11_2

                    L11_2 = Config

                    L11_2 = L11_2.PoliceJobCategory

                    L10_2.job = L11_2

                    L10_2.ignoreCooldown = true

                    L8_2(L9_2, L10_2)

                    L8_2 = SendNUIMessage

                    L9_2 = {}

                    L9_2.action = "RadarFlash"

                    L8_2(L9_2)

                  end

                end

              end

            end

          end

        else

          L4_2 = L3_2 - L0_2

          L4_2 = #L4_2

          if L4_2 > 22 then

            L0_2 = false

          end

        end

      end

    end

    L3_2 = Citizen

    L3_2 = L3_2.Wait

    L4_2 = L1_2

    L3_2(L4_2)

  end

end

L5_1(L6_1)

L5_1 = Citizen

L5_1 = L5_1.CreateThread

function L6_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L0_2 = {}

  L1_2 = {}

  L1_2.name = "wheel_lf"

  L1_2.index = 0

  L2_2 = {}

  L2_2.name = "wheel_lr"

  L2_2.index = 4

  L3_2 = {}

  L3_2.name = "wheel_rf"

  L3_2.index = 1

  L4_2 = {}

  L4_2.name = "wheel_lm1"

  L4_2.index = 2

  L5_2 = {}

  L5_2.name = "wheel_rm1"

  L5_2.index = 3

  L6_2 = {}

  L6_2.name = "wheel_rr"

  L6_2.index = 5

  L7_2 = {}

  L7_2.name = "wheel_lm2"

  L7_2.index = 45

  L8_2 = {}

  L8_2.name = "wheel_rm2"

  L8_2.index = 47

  L0_2[1] = L1_2

  L0_2[2] = L2_2

  L0_2[3] = L3_2

  L0_2[4] = L4_2

  L0_2[5] = L5_2

  L0_2[6] = L6_2

  L0_2[7] = L7_2

  L0_2[8] = L8_2

  while true do

    L1_2 = 1500

    L2_2 = IsPedInAnyVehicle

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    if L2_2 then

      L2_2 = GetVehiclePedIsIn

      L3_2 = PlayerPedId

      L3_2 = L3_2()

      L4_2 = false

      L2_2 = L2_2(L3_2, L4_2)

      L3_2 = GetPedInVehicleSeat

      L4_2 = L2_2

      L5_2 = -1

      L3_2 = L3_2(L4_2, L5_2)

      L4_2 = PlayerPedId

      L4_2 = L4_2()

      if L3_2 == L4_2 then

        L1_2 = 500

        L3_2 = GetClosestObjectOfType

        L4_2 = GetEntityCoords

        L5_2 = L2_2

        L4_2 = L4_2(L5_2)

        L5_2 = 50.0

        L6_2 = GetHashKey

        L7_2 = "p_ld_stinger_s"

        L6_2 = L6_2(L7_2)

        L7_2 = false

        L8_2 = false

        L9_2 = false

        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

        if 0 ~= L3_2 then

          L1_2 = 10

          L4_2 = GetEntityCoords

          L5_2 = L3_2

          L4_2 = L4_2(L5_2)

          L5_2 = GetEntitySpeed

          L6_2 = L2_2

          L5_2 = L5_2(L6_2)

          if L5_2 > 15 then

            L5_2 = GetEntityCoords

            L6_2 = L2_2

            L5_2 = L5_2(L6_2)

            L5_2 = L4_2 - L5_2

            L5_2 = #L5_2

            if L5_2 < 5 then

              L5_2 = 1

              L6_2 = GetVehicleNumberOfWheels

              L7_2 = L2_2

              L6_2 = L6_2(L7_2)

              L7_2 = 1

              for L8_2 = L5_2, L6_2, L7_2 do

                L9_2 = IsVehicleTyreBurst

                L10_2 = L2_2

                L11_2 = L0_2[L8_2]

                L11_2 = L11_2.index

                L12_2 = false

                L9_2 = L9_2(L10_2, L11_2, L12_2)

                if not L9_2 then

                  L9_2 = SetVehicleTyreBurst

                  L10_2 = L2_2

                  L11_2 = L0_2[L8_2]

                  L11_2 = L11_2.index

                  L12_2 = true

                  L13_2 = 0

                  L9_2(L10_2, L11_2, L12_2, L13_2)

                end

              end

            end

          else

            L5_2 = 1

            L6_2 = GetVehicleNumberOfWheels

            L7_2 = L2_2

            L6_2 = L6_2(L7_2)

            L7_2 = 1

            for L8_2 = L5_2, L6_2, L7_2 do

              L9_2 = GetWorldPositionOfEntityBone

              L10_2 = L2_2

              L11_2 = GetEntityBoneIndexByName

              L12_2 = L2_2

              L13_2 = L0_2[L8_2]

              L13_2 = L13_2.name

              L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)

              L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)

              L9_2 = L4_2 - L9_2

              L9_2 = #L9_2

              if L9_2 < 1 then

                L9_2 = IsVehicleTyreBurst

                L10_2 = L2_2

                L11_2 = L0_2[L8_2]

                L11_2 = L11_2.index

                L12_2 = false

                L9_2 = L9_2(L10_2, L11_2, L12_2)

                if not L9_2 then

                  L9_2 = SetVehicleTyreBurst

                  L10_2 = L2_2

                  L11_2 = L0_2[L8_2]

                  L11_2 = L11_2.index

                  L12_2 = true

                  L13_2 = 0

                  L9_2(L10_2, L11_2, L12_2, L13_2)

                end

              end

            end

          end

        end

      end

    end

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = L1_2

    L2_2(L3_2)

  end

end

L5_1(L6_1)

L5_1 = {}

L6_1 = true

L7_1 = 0

L8_1 = false

function L9_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  while true do

    L0_2 = FW_GetPlayerData

    L1_2 = false

    L0_2 = L0_2(L1_2)

    while nil ~= L0_2 do

      L1_2 = GetSelectedPedWeapon

      L2_2 = PlayerPedId

      L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2()

      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

      L2_2 = 500

      L3_2 = L8_1

      if not L3_2 and 0 ~= L1_2 then

        L3_2 = GetHashKey

        L4_2 = "weapon_flashlight"

        L3_2 = L3_2(L4_2)

        if L1_2 == L3_2 then

          L3_2 = true

          L8_1 = L3_2

          L3_2 = PlayerPedId

          L3_2 = L3_2()

          L4_2 = CanOpenTablet

          L5_2 = L0_2.job

          L5_2 = L5_2.name

          L4_2 = L4_2(L5_2)

          L4_2 = L4_2[1]

          L5_2 = GetGameTimer

          L5_2 = L5_2()

          L6_2 = L7_1

          L5_2 = L5_2 - L6_2

          L6_2 = 10000

          if L5_2 > L6_2 then

            L5_2 = FW_GetPlayerData

            L6_2 = false

            L5_2 = L5_2(L6_2)

            L0_2 = L5_2

            L5_2 = GetGameTimer

            L5_2 = L5_2()

            L7_1 = L5_2

          end

          if L4_2 then

            L5_2 = Config

            L5_2 = L5_2.Framework

            if "qbcore" == L5_2 then

              L5_2 = L0_2.job

              L5_2 = L5_2.onduty

              if L5_2 then

                goto lbl_64

              end

            end

            if L4_2 then

              L5_2 = exports

              L5_2 = L5_2.origen_police

              L6_2 = L5_2

              L5_2 = L5_2.IsOnDuty

              L5_2 = L5_2(L6_2)

              if L5_2 then

                goto lbl_64

              end

            end

          end

          L5_2 = false

          ::lbl_64::

          L6_2 = FW_TriggerCallback

          L7_2 = "origen_police:callback:GetEvidences"

          function L8_2(A0_3)

            local L1_3, L2_3, L3_3

            L1_3 = nil

            L2_3 = Citizen

            L2_3 = L2_3.CreateThread

            function L3_3()

              local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4

              L0_4 = A0_3

              L5_1 = L0_4

              while true do

                L0_4 = L1_2

                L1_4 = GetHashKey

                L2_4 = "weapon_flashlight"

                L1_4 = L1_4(L2_4)

                if L0_4 ~= L1_4 then

                  break

                end

                L0_4 = 1000

                L1_4 = GetSelectedPedWeapon

                L2_4 = PlayerPedId

                L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4 = L2_4()

                L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4)

                L1_2 = L1_4

                L1_4 = IsPlayerFreeAiming

                L2_4 = PlayerId

                L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4 = L2_4()

                L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4)

                if not L1_4 then

                  L1_4 = GetPedConfigFlag

                  L2_4 = L3_2

                  L3_4 = 78

                  L1_4 = L1_4(L2_4, L3_4)

                  if not L1_4 then

                    goto lbl_228

                  end

                end

                L0_4 = 0

                L1_4 = GetEntityCoords

                L2_4 = L3_2

                L1_4 = L1_4(L2_4)

                L2_4 = 1

                L3_4 = L5_1

                L3_4 = #L3_4

                L4_4 = 1

                for L5_4 = L2_4, L3_4, L4_4 do

                  L6_4 = L5_1

                  L6_4 = L6_4[L5_4]

                  if L6_4 then

                    L6_4 = L5_1

                    L6_4 = L6_4[L5_4]

                    L6_4 = L6_4.coords

                    L6_4 = L1_4 - L6_4

                    L6_4 = #L6_4

                    L7_4 = Config

                    L7_4 = L7_4.EvidenceDrawDistance

                    if L6_4 < L7_4 then

                      L6_4 = DrawMarker

                      L7_4 = Config

                      L7_4 = L7_4.Evidences

                      L8_4 = L5_1

                      L8_4 = L8_4[L5_4]

                      L8_4 = L8_4.type

                      L7_4 = L7_4[L8_4]

                      L7_4 = L7_4.sprite

                      L8_4 = L5_1

                      L8_4 = L8_4[L5_4]

                      L8_4 = L8_4.coords

                      L9_4 = 0.0

                      L10_4 = 0.0

                      L11_4 = 0.0

                      L12_4 = 0.0

                      L13_4 = 0.0

                      L14_4 = 0.0

                      L15_4 = 0.2

                      L16_4 = 0.2

                      L17_4 = 0.2

                      L18_4 = Config

                      L18_4 = L18_4.Evidences

                      L19_4 = L5_1

                      L19_4 = L19_4[L5_4]

                      L19_4 = L19_4.type

                      L18_4 = L18_4[L19_4]

                      L18_4 = L18_4.color

                      L18_4 = L18_4.r

                      if not L18_4 then

                        L18_4 = L5_1

                        L18_4 = L18_4[L5_4]

                        L18_4 = L18_4.color

                        L18_4 = L18_4[1]

                      end

                      L19_4 = Config

                      L19_4 = L19_4.Evidences

                      L20_4 = L5_1

                      L20_4 = L20_4[L5_4]

                      L20_4 = L20_4.type

                      L19_4 = L19_4[L20_4]

                      L19_4 = L19_4.color

                      L19_4 = L19_4.g

                      if not L19_4 then

                        L19_4 = L5_1

                        L19_4 = L19_4[L5_4]

                        L19_4 = L19_4.color

                        L19_4 = L19_4[2]

                      end

                      L20_4 = Config

                      L20_4 = L20_4.Evidences

                      L21_4 = L5_1

                      L21_4 = L21_4[L5_4]

                      L21_4 = L21_4.type

                      L20_4 = L20_4[L21_4]

                      L20_4 = L20_4.color

                      L20_4 = L20_4.b

                      if not L20_4 then

                        L20_4 = L5_1

                        L20_4 = L20_4[L5_4]

                        L20_4 = L20_4.color

                        L20_4 = L20_4[3]

                      end

                      L21_4 = 255

                      L22_4 = false

                      L23_4 = false

                      L24_4 = 0

                      L25_4 = true

                      L6_4(L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4)

                      L6_4 = L5_1

                      L6_4 = L6_4[L5_4]

                      L6_4 = L6_4.count

                      if L6_4 then

                        L6_4 = DrawText3D

                        L7_4 = L5_1

                        L7_4 = L7_4[L5_4]

                        L7_4 = L7_4.coords

                        L7_4 = L7_4.x

                        L8_4 = L5_1

                        L8_4 = L8_4[L5_4]

                        L8_4 = L8_4.coords

                        L8_4 = L8_4.y

                        L9_4 = L5_1

                        L9_4 = L9_4[L5_4]

                        L9_4 = L9_4.coords

                        L9_4 = L9_4.z

                        L9_4 = L9_4 + 0.2

                        L10_4 = "x"

                        L11_4 = L5_1

                        L11_4 = L11_4[L5_4]

                        L11_4 = L11_4.count

                        L10_4 = L10_4 .. L11_4

                        L6_4(L7_4, L8_4, L9_4, L10_4)

                      end

                      L6_4 = L5_1

                      L6_4 = L6_4[L5_4]

                      L6_4 = L6_4.coords

                      L6_4 = L1_4 - L6_4

                      L6_4 = #L6_4

                      L7_4 = 1.5

                      if L6_4 < L7_4 then

                        L6_4 = L5_2

                        if L6_4 then

                          L6_4 = Config

                          L6_4 = L6_4.Translations

                          L6_4 = L6_4.CollectEvidence

                          if L6_4 then

                            goto lbl_164

                          end

                        end

                        L6_4 = Config

                        L6_4 = L6_4.Translations

                        L6_4 = L6_4.ClearEvidence

                        ::lbl_164::

                        L7_4 = Config

                        L7_4 = L7_4.CustomNotify

                        if L7_4 then

                          L7_4 = ShowHelpNotification

                          L8_4 = "E"

                          L9_4 = L6_4

                          L7_4(L8_4, L9_4)

                          L7_4 = true

                          L1_3 = L7_4

                        else

                          L7_4 = Config

                          L7_4 = L7_4.Framework

                          if "qbcore" == L7_4 then

                            L7_4 = L1_3

                            if not L7_4 then

                              L7_4 = exports

                              L7_4 = L7_4["qb-core"]

                              L8_4 = L7_4

                              L7_4 = L7_4.DrawText

                              L9_4 = "[E] "

                              L10_4 = L6_4

                              L9_4 = L9_4 .. L10_4

                              L10_4 = "left"

                              L7_4(L8_4, L9_4, L10_4)

                              L7_4 = true

                              L1_3 = L7_4

                            end

                          else

                            L7_4 = Framework

                            L7_4 = L7_4.ShowHelpNotification

                            L8_4 = "~INPUT_PICKUP~ "

                            L9_4 = L6_4

                            L8_4 = L8_4 .. L9_4

                            L9_4 = true

                            L7_4(L8_4, L9_4)

                          end

                        end

                        L7_4 = IsControlJustPressed

                        L8_4 = 0

                        L9_4 = 38

                        L7_4 = L7_4(L8_4, L9_4)

                        if L7_4 then

                          L7_4 = L5_2

                          if L7_4 then

                            L7_4 = TriggerServerEvent

                            L8_4 = "origen_police:server:GetEvidence"

                            L9_4 = L5_4

                            L10_4 = L5_1

                            L10_4 = L10_4[L5_4]

                            L7_4(L8_4, L9_4, L10_4)

                            L7_4 = CollectEvidenceAnim

                            L8_4 = L5_4

                            L7_4(L8_4)

                          else

                            L7_4 = TriggerServerEvent

                            L8_4 = "origen_police:server:RemoveEvidence"

                            L9_4 = L5_4

                            L7_4(L8_4, L9_4)

                            L7_4 = CollectEvidenceAnim

                            L8_4 = L5_4

                            L7_4(L8_4)

                          end

                        end

                      end

                    end

                  end

                end

                goto lbl_235

                ::lbl_228::

                L1_4 = L1_3

                if L1_4 then

                  L1_4 = HideHelpNotification

                  L1_4()

                  L1_4 = nil

                  L1_3 = L1_4

                end

                ::lbl_235::

                L1_4 = Citizen

                L1_4 = L1_4.Wait

                L2_4 = L0_4

                L1_4(L2_4)

              end

              L0_4 = L1_3

              if L0_4 then

                L0_4 = HideHelpNotification

                L0_4()

                L0_4 = nil

                L1_3 = L0_4

              end

              L0_4 = {}

              L5_1 = L0_4

            end

            L2_3(L3_3)

          end

          L9_2 = GetEntityCoords

          L10_2 = L3_2

          L9_2, L10_2 = L9_2(L10_2)

          L6_2(L7_2, L8_2, L9_2, L10_2)

      end

      else

        L3_2 = GetHashKey

        L4_2 = "weapon_flashlight"

        L3_2 = L3_2(L4_2)

        if L1_2 ~= L3_2 then

          L3_2 = false

          L8_1 = L3_2

        end

        L2_2 = 3000

      end

      L3_2 = L6_1

      if not L3_2 then

        break

      end

      L3_2 = Wait

      L4_2 = L2_2

      L3_2(L4_2)

    end

    L1_2 = L6_1

    if not L1_2 then

      break

    end

  end

end

function L10_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L1_2 = RequestAnimDict

  L2_2 = "pickup_object"

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = "pickup_object"

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 7

    L1_2(L2_2)

  end

  L1_2 = RequestAnimDict

  L2_2 = "pickup_object"

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = "pickup_object"

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 7

    L1_2(L2_2)

  end

  L1_2 = L5_1

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L1_2 = L5_1

    L1_2 = L1_2[A0_2]

    L1_2 = L1_2.type

    if L1_2 then

      L1_2 = Config

      L1_2 = L1_2.Evidences

      L2_2 = L5_1

      L2_2 = L2_2[A0_2]

      L2_2 = L2_2.type

      L1_2 = L1_2[L2_2]

      L1_2 = L1_2.anim

      if L1_2 then

        L1_2 = TaskPlayAnim

        L2_2 = PlayerPedId

        L2_2 = L2_2()

        L3_2 = "pickup_object"

        L4_2 = "pickup_low"

        L5_2 = 8.0

        L6_2 = -8.0

        L7_2 = -1

        L8_2 = 1

        L9_2 = 0

        L10_2 = false

        L11_2 = false

        L12_2 = false

        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

      end

  end

  else

    L1_2 = print

    L2_2 = "Something went wrong with the evidence type, DATA: "

    L3_2 = json

    L3_2 = L3_2.encode

    L4_2 = L5_1

    L4_2 = L4_2[A0_2]

    L3_2 = L3_2(L4_2)

    L4_2 = "ID: "

    L5_2 = A0_2

    L1_2(L2_2, L3_2, L4_2, L5_2)

  end

  L1_2 = GetGameTimer

  L1_2 = L1_2()

  L2_2 = L5_1

  L2_2 = L2_2[A0_2]

  L2_2 = L2_2.coords

  while true do

    L3_2 = SetIkTarget

    L4_2 = PlayerPedId

    L4_2 = L4_2()

    L5_2 = 4

    L6_2 = nil

    L7_2 = nil

    L8_2 = L2_2.x

    L9_2 = L2_2.y

    L10_2 = L2_2.z

    L11_2 = 0.0

    L12_2 = 50

    L13_2 = 200

    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    L3_2 = Wait

    L4_2 = 0

    L3_2(L4_2)

    L3_2 = GetGameTimer

    L3_2 = L3_2()

    L3_2 = L3_2 - L1_2

    L4_2 = 1000

    if L3_2 > L4_2 then

      break

    end

  end

  L3_2 = ClearPedTasks

  L4_2 = PlayerPedId

  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2()

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

end

CollectEvidenceAnim = L10_1

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:OnPlayerLoaded"

function L12_1()

  local L0_2, L1_2

  L0_2 = Config

  L0_2 = L0_2.EvidenceSystem

  if not L0_2 then

    return

  end

  L0_2 = L9_1

  L0_2()

end

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:rmevidence"

function L12_1(A0_2)

  local L1_2

  L1_2 = L5_1

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L1_2 = L5_1

    L1_2[A0_2] = nil

  end

end

L10_1(L11_1, L12_1)

function L10_1(A0_2, A1_2, A2_2, A3_2, A4_2)

  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L5_2 = World3dToScreen2d

  L6_2 = A0_2

  L7_2 = A1_2

  L8_2 = A2_2

  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2)

  L8_2 = string

  L8_2 = L8_2.len

  L9_2 = A3_2

  L8_2 = L8_2(L9_2)

  L8_2 = L8_2 / 370

  if not A4_2 then

    A4_2 = 4

  end

  L9_2 = SetTextScale

  L10_2 = 0.38

  L11_2 = 0.38

  L9_2(L10_2, L11_2)

  L9_2 = SetTextFont

  L10_2 = A4_2

  L9_2(L10_2)

  L9_2 = SetTextProportional

  L10_2 = 1

  L9_2(L10_2)

  L9_2 = SetTextColour

  L10_2 = 255

  L11_2 = 255

  L12_2 = 255

  L13_2 = 215

  L9_2(L10_2, L11_2, L12_2, L13_2)

  L9_2 = SetTextEntry

  L10_2 = "STRING"

  L9_2(L10_2)

  L9_2 = SetTextCentre

  L10_2 = true

  L9_2(L10_2)

  L9_2 = AddTextComponentString

  L10_2 = A3_2

  L9_2(L10_2)

  L9_2 = SetTextDropshadow

  L10_2 = L8_2

  L11_2 = 255

  L12_2 = 0

  L13_2 = 0

  L14_2 = 255

  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)

  L9_2 = DrawText

  L10_2 = L6_2

  L11_2 = L7_2

  L9_2(L10_2, L11_2)

end

DrawText3D = L10_1

L10_1 = false

function L11_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = Config

  L1_2 = L1_2.WeaponSilencierBlockShootAlert

  if L1_2 then

    L1_2 = IsPedCurrentWeaponSilenced

    L2_2 = PlayerPedId

    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2()

    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

    if L1_2 then

      L1_2 = Debuger

      L2_2 = "Weapon has a silencier, not sending shoot alert"

      L1_2(L2_2)

      return

    end

  end

  L1_2 = IsWeaponBlacklisted

  L2_2 = A0_2.name

  L1_2 = L1_2(L2_2)

  if L1_2 then

    L1_2 = Debuger

    L2_2 = "Weapon is blacklisted, not sending shoot alert"

    L1_2(L2_2)

    return

  end

  L1_2 = Config

  L1_2 = L1_2.ShootAlertRequireSeen

  if L1_2 then

    L1_2 = IsBeingSeen

    L1_2 = L1_2()

    if not L1_2 then

      L1_2 = Debuger

      L2_2 = "Player is not being seen by any player or ambient peds, not sending shoot alert, you can disable this in Config.ShootAlertRequireSeen"

      L1_2(L2_2)

      return

    end

  end

  L1_2 = Config

  L1_2 = L1_2.ShootAlertDisablePolice

  if L1_2 then

    L1_2 = CanOpenTablet

    L2_2 = FW_GetPlayerData

    L3_2 = false

    L2_2 = L2_2(L3_2)

    L2_2 = L2_2.job

    L2_2 = L2_2.name

    L1_2 = L1_2(L2_2)

    L1_2 = L1_2[1]

    if L1_2 then

      L1_2 = Debuger

      L2_2 = "Player has a job listed in config/jobs.lua, not sending shoot alert, you can disable this in Config.ShootAlertDisablePolice"

      L1_2(L2_2)

      return

    end

  end

  L1_2 = L10_1

  if L1_2 then

    L1_2 = GetGameTimer

    L1_2 = L1_2()

    L2_2 = L10_1

    L1_2 = L1_2 - L2_2

    L2_2 = Config

    L2_2 = L2_2.ShootAlertCooldown

    if L1_2 < L2_2 then

      L1_2 = Debuger

      L2_2 = "Shoot alert cooldown("

      L3_2 = Config

      L3_2 = L3_2.ShootAlertCooldown

      L4_2 = GetGameTimer

      L4_2 = L4_2()

      L5_2 = L10_1

      L4_2 = L4_2 - L5_2

      L3_2 = L3_2 - L4_2

      L3_2 = L3_2 / 1000

      L4_2 = " sec), not sending shoot alert"

      L2_2 = L2_2 .. L3_2 .. L4_2

      L1_2(L2_2)

      return

    end

  end

  L1_2 = GetGameTimer

  L1_2 = L1_2()

  L10_1 = L1_2

  L1_2 = GetPedAmmoTypeFromWeapon

  L2_2 = PlayerPedId

  L2_2 = L2_2()

  L3_2 = GetHashKey

  L4_2 = A0_2.name

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)

  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

  if L1_2 then

    L2_2 = IsAmmoBlacklisted

    L3_2 = L1_2

    L2_2 = L2_2(L3_2)

    if L2_2 then

      L2_2 = Debuger

      L3_2 = "Ammo type is blacklisted("

      L4_2 = L1_2

      L5_2 = "), not sending shoot alert"

      L3_2 = L3_2 .. L4_2 .. L5_2

      L2_2(L3_2)

      return

    end

  end

  L2_2 = math

  L2_2 = L2_2.randomseed

  L3_2 = GetGameTimer

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2()

  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

  L2_2 = math

  L2_2 = L2_2.random

  L3_2 = 0

  L4_2 = 100

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = Config

  L3_2 = L3_2.ShootAlertWeaponChance

  L2_2 = L2_2 <= L3_2

  L3_2 = math

  L3_2 = L3_2.random

  L4_2 = 0

  L5_2 = 100

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = Config

  L4_2 = L4_2.ShootAlertAmmoChance

  L3_2 = L3_2 <= L4_2

  L4_2 = Debuger

  L5_2 = "Shoot alert data: "

  L6_2 = json

  L6_2 = L6_2.encode

  L7_2 = {}

  L7_2.weaponChance = L2_2

  L7_2.ammoChance = L3_2

  L8_2 = L10_1

  L7_2.lastshootalert = L8_2

  L7_2.weaponData = A0_2

  L7_2.ammotype = L1_2

  L8_2 = A0_2.name

  if not L8_2 then

    L8_2 = "Unknown"

  end

  L7_2.weaponName = L8_2

  L8_2 = A0_2.label

  if not L8_2 then

    L8_2 = "Unknown"

  end

  L7_2.weaponLabel = L8_2

  L8_2 = {}

  L8_2.indent = true

  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2)

  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)

  L4_2 = TriggerServerEvent

  L5_2 = "SendAlert:police"

  L6_2 = {}

  L7_2 = GetEntityCoords

  L8_2 = PlayerPedId

  L8_2, L9_2 = L8_2()

  L7_2 = L7_2(L8_2, L9_2)

  L6_2.coords = L7_2

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2["215"]

  L6_2.title = L7_2

  L6_2.type = "215"

  L7_2 = {}

  if L2_2 then

    L8_2 = A0_2.label

    if L8_2 then

      goto lbl_183

    end

  end

  L8_2 = nil

  ::lbl_183::

  L7_2.weapon = L8_2

  if L3_2 then

    L8_2 = GetCaliberTranslation

    L9_2 = L1_2

    L8_2 = L8_2(L9_2)

    if L8_2 then

      goto lbl_192

    end

  end

  L8_2 = nil

  ::lbl_192::

  L7_2.ammotype = L8_2

  L6_2.metadata = L7_2

  L7_2 = Config

  L7_2 = L7_2.PoliceJobCategory

  L6_2.job = L7_2

  L6_2.ignoreCooldown = true

  L4_2(L5_2, L6_2)

end

SendShootAlert = L11_1

L11_1 = RegisterNetEvent

L12_1 = "origen_police:client:robVehicle"

function L13_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = IsPedInAnyVehicle

  L2_2 = L0_2

  L3_2 = false

  L1_2 = L1_2(L2_2, L3_2)

  if L1_2 then

    L1_2 = GetEntityCoords

    L2_2 = L0_2

    L3_2 = true

    L1_2 = L1_2(L2_2, L3_2)

    L2_2 = Citizen

    L2_2 = L2_2.InvokeNative

    L3_2 = 3365332906397525184

    L4_2 = L1_2.x

    L5_2 = L1_2.y

    L6_2 = L1_2.z

    L7_2 = Citizen

    L7_2 = L7_2.PointerValueInt

    L7_2 = L7_2()

    L8_2 = Citizen

    L8_2 = L8_2.PointerValueInt

    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2()

    L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    L4_2 = {}

    if 0 ~= L2_2 then

      L5_2 = table

      L5_2 = L5_2.insert

      L6_2 = L4_2

      L7_2 = GetStreetNameFromHashKey

      L8_2 = L2_2

      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2)

      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    end

    if 0 ~= L3_2 then

      L5_2 = table

      L5_2 = L5_2.insert

      L6_2 = L4_2

      L7_2 = GetStreetNameFromHashKey

      L8_2 = L3_2

      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2)

      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    end

    L5_2 = GetVehiclePedIsIn

    L6_2 = L0_2

    L7_2 = false

    L5_2 = L5_2(L6_2, L7_2)

    L6_2 = GetDisplayNameFromVehicleModel

    L7_2 = GetEntityModel

    L8_2 = L5_2

    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2)

    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    L7_2 = TriggerServerEvent

    L8_2 = "SendAlert:police"

    L9_2 = {}

    L10_2 = GetEntityCoords

    L11_2 = PlayerPedId

    L11_2, L12_2, L13_2, L14_2 = L11_2()

    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)

    L9_2.coords = L10_2

    L10_2 = Config

    L10_2 = L10_2.Translations

    L10_2 = L10_2.VehicleRob

    L9_2.title = L10_2

    L9_2.type = "RADARS"

    L10_2 = Config

    L10_2 = L10_2.Translations

    L10_2 = L10_2.VehicleRobDesc

    L9_2.message = L10_2

    L10_2 = {}

    L10_2.model = L6_2

    L11_2 = {}

    L12_2 = GetVehicleColor

    L13_2 = GetVehiclePedIsIn

    L14_2 = PlayerPedId

    L14_2 = L14_2()

    L13_2, L14_2 = L13_2(L14_2)

    L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)

    L11_2[1] = L12_2

    L11_2[2] = L13_2

    L11_2[3] = L14_2

    L10_2.color = L11_2

    L11_2 = GetVehiclePlate

    L12_2 = GetVehiclePedIsIn

    L13_2 = PlayerPedId

    L13_2, L14_2 = L13_2()

    L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)

    L11_2 = L11_2(L12_2, L13_2, L14_2)

    L10_2.plate = L11_2

    L9_2.metadata = L10_2

    L10_2 = Config

    L10_2 = L10_2.PoliceJobCategory

    L9_2.job = L10_2

    L9_2.ignoreCooldown = true

    L7_2(L8_2, L9_2)

  end

end

L11_1(L12_1, L13_1)

L11_1 = Config

L11_1 = L11_1.Commands

L11_1 = L11_1.ForceVehicle

if L11_1 then

  L11_1 = Config

  L11_1 = L11_1.Commands

  L11_1 = L11_1.ForceVehicle

  L11_1 = L11_1.cmd

  if "" ~= L11_1 then

    L11_1 = RegisterCommand

    L12_1 = Config

    L12_1 = L12_1.Commands

    L12_1 = L12_1.ForceVehicle

    L12_1 = L12_1.cmd

    function L13_1()

      local L0_2, L1_2

      L0_2 = TriggerEvent

      L1_2 = "origen_police:client:robVehicle"

      L0_2(L1_2)

    end

    L11_1(L12_1, L13_1)

  end

end

L11_1 = exports

L12_1 = "RobVehicle"

function L13_1()

  local L0_2, L1_2

  L0_2 = TriggerEvent

  L1_2 = "origen_police:client:robVehicle"

  L0_2(L1_2)

end

L11_1(L12_1, L13_1)

