local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1

L0_1 = false

L1_1 = {}

L2_1 = true

L3_1 = Config

L3_1 = L3_1.RealWeapons

L4_1 = "backhandgun"

L5_1 = "assault"

L6_1 = nil

L7_1 = {}

L8_1 = true

L9_1 = true

L10_1 = false

L11_1 = Config

L11_1 = L11_1.Holster

if not L11_1 then

  return

end

function L11_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  if nil ~= L0_2 then

    L1_2 = L0_2.job

    if nil ~= L1_2 then

      L1_2 = L0_2.job

      L1_2 = L1_2.name

      if nil ~= L1_2 then

        goto lbl_15

      end

    end

  end

  L1_2 = false

  do return L1_2 end

  ::lbl_15::

  L1_2 = pairs

  L2_2 = Config

  L2_2 = L2_2.AllowedHolster

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = L0_2.job

    L7_2 = L7_2.name

    if L7_2 == L6_2 then

      L7_2 = true

      L0_1 = L7_2

      L7_2 = true

      return L7_2

    end

  end

  L1_2 = false

  L0_1 = L1_2

  L1_2 = false

  return L1_2

end

IsHolsterAllowed = L11_1

L11_1 = RegisterNetEvent

L12_1 = "origen_police:holster:unarm"

function L13_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = L8_1

  if L1_2 then

    L1_2 = SetCurrentPedWeapon

    L2_2 = L0_2

    L3_2 = GetHashKey

    L4_2 = "WEAPON_UNARMED"

    L3_2 = L3_2(L4_2)

    L4_2 = true

    L1_2(L2_2, L3_2, L4_2)

    L1_2 = SetPedCanSwitchWeapon

    L2_2 = L0_2

    L3_2 = true

    L1_2(L2_2, L3_2)

    L1_2 = false

    L8_1 = L1_2

    L1_2 = RemoveGears

    L1_2()

    L1_2 = ClearPedTasks

    L2_2 = L0_2

    L1_2(L2_2)

    L1_2 = ExecuteCommand

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.DoHide

    L1_2(L2_2)

  else

    L1_2 = true

    L8_1 = L1_2

    L1_2 = SetGears

    L1_2()

    L1_2 = SetPedCanSwitchWeapon

    L2_2 = L0_2

    L3_2 = true

    L1_2(L2_2, L3_2)

    L1_2 = ExecuteCommand

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.DoShow

    L1_2(L2_2)

  end

end

L11_1(L12_1, L13_1)

L11_1 = false

L12_1 = RegisterNetEvent

L13_1 = "origen_police:client:OnJobUpdate"

function L14_1(A0_2)

  local L1_2, L2_2

  L1_2 = IsHolsterAllowed

  L1_2 = L1_2()

  if L1_2 then

    L1_2 = "handguns"

    L4_1 = L1_2

  end

  L1_2 = RemoveGears

  L1_2()

  L1_2 = Wait

  L2_2 = 2000

  L1_2(L2_2)

end

L12_1(L13_1, L14_1)

L12_1 = RegisterNetEvent

L13_1 = "origen_police:client:OnPlayerLoaded"

function L14_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = FW_GetPlayerData

  L1_2 = true

  L0_2 = L0_2(L1_2)

  L1_2 = Wait

  L2_2 = 2000

  L1_2(L2_2)

  L1_2 = true

  L11_1 = L1_2

  L1_2 = L0_2.metadata

  if nil == L1_2 then

    return

  end

  L1_2 = L0_2.metadata

  L1_2 = L1_2.handgunflag

  L2_2 = L0_2.metadata

  L2_2 = L2_2.rifleflag

  L3_2 = L1_2 or L3_2

  if not L1_2 or not L1_2 then

    L3_2 = L4_1

  end

  L4_1 = L3_2

  L3_2 = L2_2 or L3_2

  if not L2_2 or not L2_2 then

    L3_2 = L5_1

  end

  L5_1 = L3_2

end

L12_1(L13_1, L14_1)

L12_1 = {}

function L13_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L3_2 = L11_1

  if not L3_2 then

    L3_2 = false

    return L3_2

  end

  L3_2 = L12_1.data

  if L3_2 then

    L3_2 = GetGameTimer

    L3_2 = L3_2()

    L4_2 = L12_1.time

    L3_2 = L3_2 - L4_2

    if not (L3_2 > 10) then

      goto lbl_26

    end

  end

  L3_2 = {}

  L4_2 = GetGameTimer

  L4_2 = L4_2()

  L3_2.time = L4_2

  L4_2 = GetPlayerItems

  L5_2 = nil

  L4_2 = L4_2(L5_2)

  L3_2.data = L4_2

  L12_1 = L3_2

  ::lbl_26::

  L3_2 = pairs

  L4_2 = L12_1.data

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = GetHashKey

    L10_2 = L8_2.name

    L9_2 = L9_2(L10_2)

    if L9_2 == A1_2 then

      L9_2 = true

      return L9_2

    end

  end

  L3_2 = false

  return L3_2

end

HasPedGotWeapon = L13_1

L13_1 = Citizen

L13_1 = L13_1.CreateThread

function L14_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L0_2 = Config

  L0_2 = L0_2.Holster

  if not L0_2 then

    return

  end

  while true do

    L0_2 = L2_1

    if L0_2 then

      break

    end

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 500

    L0_2(L1_2)

  end

  L0_2 = Citizen

  L0_2 = L0_2.Wait

  L1_2 = 5000

  L0_2(L1_2)

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = SetPedCanSwitchWeapon

  L2_2 = L0_2

  L3_2 = true

  L1_2(L2_2, L3_2)

  L1_2 = Config

  L1_2 = L1_2.RealWeapons

  L3_1 = L1_2

  L1_2 = Config

  L1_2 = L1_2.WeaponCategoryOffsets

  L7_1 = L1_2

  while true do

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1500

    L1_2(L2_2)

    L1_2 = PlayerPedId

    L1_2 = L1_2()

    L0_2 = L1_2

    L1_2 = L8_1

    if L1_2 then

      L1_2 = L11_1

      if L1_2 then

        L1_2 = 1

        L2_2 = L3_1

        L2_2 = #L2_2

        L3_2 = 1

        for L4_2 = L1_2, L2_2, L3_2 do

          L5_2 = GetHashKey

          L6_2 = L3_1

          L6_2 = L6_2[L4_2]

          L6_2 = L6_2.name

          L5_2 = L5_2(L6_2)

          L6_2 = HasPedGotWeapon

          L7_2 = L0_2

          L8_2 = L5_2

          L9_2 = false

          L6_2 = L6_2(L7_2, L8_2, L9_2)

          if L6_2 then

            L6_2 = L3_1

            L6_2 = L6_2[L4_2]

            L7_2 = L6_2.name

            L6_2 = L1_1

            L6_2 = L6_2[L7_2]

            if not L6_2 then

              L6_2 = GetSelectedPedWeapon

              L7_2 = L0_2

              L6_2 = L6_2(L7_2)

              if L5_2 ~= L6_2 then

                L6_2 = L3_1

                L6_2 = L6_2[L4_2]

                L6_2 = L6_2.model

                if nil ~= L6_2 then

                  L6_2 = SetGear

                  L7_2 = L3_1

                  L7_2 = L7_2[L4_2]

                  L7_2 = L7_2.name

                  L6_2(L7_2)

                end

            end

            else

              L6_2 = GetSelectedPedWeapon

              L7_2 = L0_2

              L6_2 = L6_2(L7_2)

              if L5_2 == L6_2 then

                L6_2 = RemoveGear

                L7_2 = L3_1

                L7_2 = L7_2[L4_2]

                L7_2 = L7_2.name

                L6_2(L7_2)

              end

            end

          else

            L6_2 = L3_1

            L6_2 = L6_2[L4_2]

            L7_2 = L6_2.name

            L6_2 = L1_1

            L6_2 = L6_2[L7_2]

            if L6_2 then

              L6_2 = RemoveGear

              L7_2 = L3_1

              L7_2 = L7_2[L4_2]

              L7_2 = L7_2.name

              L6_2(L7_2)

            end

          end

        end

    end

    else

      L1_2 = RemoveGears

      L1_2()

    end

  end

end

L13_1(L14_1)

function L13_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = {}

  L2_2 = pairs

  L3_2 = L1_1

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    if L6_2 ~= A0_2 then

      L1_2[L6_2] = L7_2

    else

      L8_2 = DeleteEntity

      L9_2 = L7_2

      L8_2(L9_2)

    end

  end

  L1_1 = L1_2

end

RemoveGear = L13_1

function L13_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L0_2 = pairs

  L1_2 = L1_1

  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

    L6_2 = DeleteEntity

    L7_2 = L5_2

    L6_2(L7_2)

  end

  L0_2 = {}

  L1_1 = L0_2

end

RemoveGears = L13_1

function L13_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L1_2 = 1

  L2_2 = L7_1

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = L7_1

    L5_2 = L5_2[L4_2]

    L5_2 = L5_2.category

    if L5_2 == A0_2 then

      L5_2 = L7_1

      L5_2 = L5_2[L4_2]

      L5_2 = L5_2.bone

      L6_2 = L7_1

      L6_2 = L6_2[L4_2]

      L6_2 = L6_2.x

      L7_2 = L7_1

      L7_2 = L7_2[L4_2]

      L7_2 = L7_2.y

      L8_2 = L7_1

      L8_2 = L8_2[L4_2]

      L8_2 = L8_2.z

      L9_2 = L7_1

      L9_2 = L9_2[L4_2]

      L9_2 = L9_2.xRot

      L10_2 = L7_1

      L10_2 = L10_2[L4_2]

      L10_2 = L10_2.yRot

      L11_2 = L7_1

      L11_2 = L11_2[L4_2]

      L11_2 = L11_2.zRot

      return L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

    end

  end

end

GetCoords = L13_1

function L13_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2

  L1_2 = nil

  L2_2 = 0.0

  L3_2 = 0.0

  L4_2 = 0.0

  L5_2 = 0.0

  L6_2 = 0.0

  L7_2 = 0.0

  L8_2 = PlayerPedId

  L8_2 = L8_2()

  L9_2 = nil

  L10_2 = nil

  L11_2 = IsHolsterAllowed

  L11_2 = L11_2()

  if not L11_2 then

    return

  end

  L11_2 = 1

  L12_2 = L3_1

  L12_2 = #L12_2

  L13_2 = 1

  for L14_2 = L11_2, L12_2, L13_2 do

    L15_2 = L3_1

    L15_2 = L15_2[L14_2]

    L15_2 = L15_2.name

    if L15_2 == A0_2 then

      L15_2 = L3_1

      L15_2 = L15_2[L14_2]

      L15_2 = L15_2.category

      -- [INST INST-028 RAC-002] 2026-04-23 — Rewrite holster weapon-category dispatch.
      -- FIX: Bug del decompilador ("no visible label 'lbl_49' for <goto>").
      -- Semántica preservada 1:1. Backup: _backup_RAC-002/holster.lua
      do
        local _cat = L3_1[L14_2].category
        if _cat == "handguns" or _cat == "revolver" then
          if L10_2 then
            if not L10_1 then
              L6_1 = "handguns"
              L4_1 = "handguns"
            end
          else
            L6_1 = L4_1
          end
        else
          if _cat == "machine" or _cat == "assault" or _cat == "shotgun" or _cat == "sniper" or _cat == "heavy" then
            L6_1 = L5_1
          else
            L6_1 = _cat
          end
        end
      end

      L15_2 = GetCoords

      L16_2 = L6_1

      L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L15_2(L16_2)

      L7_2 = L21_2

      L6_2 = L20_2

      L5_2 = L19_2

      L4_2 = L18_2

      L3_2 = L17_2

      L2_2 = L16_2

      L1_2 = L15_2

      L15_2 = L3_1

      L15_2 = L15_2[L14_2]

      L9_2 = L15_2.model

      break

    end

  end

  L11_2 = GetEntityCoords

  L12_2 = L8_2

  L11_2 = L11_2(L12_2)

  L12_2 = CreateObject

  L13_2 = L9_2

  L14_2 = L11_2.x

  L15_2 = L11_2.y

  L16_2 = L11_2.z

  L17_2 = true

  L18_2 = true

  L19_2 = false

  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  L13_2 = GetPedBoneIndex

  L14_2 = L8_2

  L15_2 = L1_2

  L13_2 = L13_2(L14_2, L15_2)

  L14_2 = SetEntityCollision

  L15_2 = L12_2

  L16_2 = false

  L17_2 = false

  L14_2(L15_2, L16_2, L17_2)

  L14_2 = AttachEntityToEntity

  L15_2 = L12_2

  L16_2 = L8_2

  L17_2 = L13_2

  L18_2 = L2_2

  L19_2 = L3_2

  L20_2 = L4_2

  L21_2 = L5_2

  L22_2 = L6_2

  L23_2 = L7_2

  L24_2 = false

  L25_2 = false

  L26_2 = false

  L27_2 = false

  L28_2 = 2

  L29_2 = true

  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)

  L14_2 = SetEntityCollision

  L15_2 = L12_2

  L16_2 = false

  L17_2 = false

  L14_2(L15_2, L16_2, L17_2)

  L14_2 = L1_1

  L14_2[A0_2] = L12_2

end

SetGear = L13_1

function L13_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = 1

  L2_2 = L3_1

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = HasPedGotWeapon

    L6_2 = L0_2

    L7_2 = GetHashKey

    L8_2 = L3_1

    L8_2 = L8_2[L4_2]

    L8_2 = L8_2.name

    L7_2 = L7_2(L8_2)

    L8_2 = false

    L5_2 = L5_2(L6_2, L7_2, L8_2)

    if L5_2 then

      L5_2 = SetGear

      L6_2 = L3_1

      L6_2 = L6_2[L4_2]

      L6_2 = L6_2.name

      L5_2(L6_2)

    end

  end

end

SetGears = L13_1

L13_1 = RegisterCommand

L14_1 = "holster"

function L15_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = IsHolsterAllowed

  L2_2 = L2_2()

  if L2_2 then

    L2_2 = A1_2[1]

    if nil == L2_2 then

      L2_2 = FW_Notify

      L3_2 = Config

      L3_2 = L3_2.Translations

      L3_2 = L3_2.SomethingWrong

      return L2_2(L3_2)

    else

      L2_2 = A1_2[1]

      if "handguns" ~= L2_2 then

        L2_2 = A1_2[1]

        if "waisthandgun" ~= L2_2 then

          goto lbl_29

        end

      end

      L2_2 = A1_2[1]

      L4_1 = L2_2

      L2_2 = FW_Notify

      L3_2 = Config

      L3_2 = L3_2.Translations

      L3_2 = L3_2.HipHolster

      L2_2(L3_2)

      goto lbl_100

      ::lbl_29::

      L2_2 = A1_2[1]

      if "backhandgun" == L2_2 then

        L2_2 = A1_2[1]

        L4_1 = L2_2

        L2_2 = FW_Notify

        L3_2 = Config

        L3_2 = L3_2.Translations

        L3_2 = L3_2.BackHolster

        L2_2(L3_2)

      else

        L2_2 = A1_2[1]

        if "leghandgun" ~= L2_2 then

          L2_2 = A1_2[1]

          if "hiphandgun" ~= L2_2 then

            L2_2 = A1_2[1]

            if "handguns2" ~= L2_2 then

              goto lbl_57

            end

          end

        end

        L2_2 = A1_2[1]

        L4_1 = L2_2

        L2_2 = FW_Notify

        L3_2 = Config

        L3_2 = L3_2.Translations

        L3_2 = L3_2.LegHolster

        L2_2(L3_2)

        goto lbl_100

        ::lbl_57::

        L2_2 = A1_2[1]

        if "chesthandgun" == L2_2 then

          L2_2 = A1_2[1]

          L4_1 = L2_2

          L2_2 = FW_Notify

          L3_2 = Config

          L3_2 = L3_2.Translations

          L3_2 = L3_2.UpperHolster

          L2_2(L3_2)

        else

          L2_2 = A1_2[1]

          if "boxers" == L2_2 then

            L2_2 = A1_2[1]

            L4_1 = L2_2

            L2_2 = FW_Notify

            L3_2 = Config

            L3_2 = L3_2.Translations

            L3_2 = L3_2.UnderPantsHolster

            L2_2(L3_2)

          else

            L2_2 = A1_2[1]

            if "assault" == L2_2 then

              L2_2 = A1_2[1]

              L5_1 = L2_2

              L2_2 = FW_Notify

              L3_2 = Config

              L3_2 = L3_2.Translations

              L3_2 = L3_2.LongHolsterBack

              L2_2(L3_2)

            else

              L2_2 = A1_2[1]

              if "tacticalrifle" == L2_2 then

                L2_2 = A1_2[1]

                L5_1 = L2_2

                L2_2 = FW_Notify

                L3_2 = Config

                L3_2 = L3_2.Translations

                L3_2 = L3_2.LongHolsterFront

                L2_2(L3_2)

              end

            end

          end

        end

      end

    end

    ::lbl_100::

    L2_2 = TriggerServerEvent

    L3_2 = "origen_police:SetMetaData"

    L4_2 = "rifleflag"

    L5_2 = L5_1

    L2_2(L3_2, L4_2, L5_2)

    L2_2 = TriggerServerEvent

    L3_2 = "origen_police:SetMetaData"

    L4_2 = "handgunflag"

    L5_2 = L4_1

    L2_2(L3_2, L4_2, L5_2)

    L2_2 = RemoveGears

    L2_2()

    L2_2 = true

    L10_1 = L2_2

  end

end

L13_1(L14_1, L15_1)

function L13_1(A0_2)

  local L1_2, L2_2

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = RequestAnimDict

    L2_2 = A0_2

    L1_2(L2_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 100

    L1_2(L2_2)

  end

end

loadAnimDict = L13_1

function L13_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = IsEntityDead

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if L2_2 then

    blocked = false

    L2_2 = false

    return L2_2

  else

    L2_2 = 1

    L3_2 = L3_1

    L3_2 = #L3_2

    L4_2 = 1

    for L5_2 = L2_2, L3_2, L4_2 do

      L6_2 = GetHashKey

      L7_2 = L3_1

      L7_2 = L7_2[L5_2]

      L7_2 = L7_2.name

      L6_2 = L6_2(L7_2)

      L7_2 = GetSelectedPedWeapon

      L8_2 = A0_2

      L7_2 = L7_2(L8_2)

      if L6_2 == L7_2 then

        L6_2 = true

        return L6_2

      end

    end

    L2_2 = false

    return L2_2

  end

end

CheckWeapon = L13_1

function L13_1(A0_2)

  local L1_2, L2_2

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = RequestAnimDict

    L2_2 = A0_2

    L1_2(L2_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 0

    L1_2(L2_2)

  end

end

loadAnimDict2 = L13_1

L13_1 = Citizen

L13_1 = L13_1.CreateThread

function L14_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L0_2 = Config

  L0_2 = L0_2.Holster

  if not L0_2 then

    return

  end

  L0_2 = loadAnimDict

  L1_2 = "rcmjosh4"

  L0_2(L1_2)

  L0_2 = loadAnimDict

  L1_2 = "reaction@intimidation@cop@unarmed"

  L0_2(L1_2)

  L0_2 = loadAnimDict

  L1_2 = "reaction@intimidation@1h"

  L0_2(L1_2)

  L0_2 = loadAnimDict2

  L1_2 = "combat@combat_reactions@pistol_1h_gang"

  L0_2(L1_2)

  L0_2 = loadAnimDict2

  L1_2 = "combat@combat_reactions@pistol_1h_hillbilly"

  L0_2(L1_2)

  L0_2 = loadAnimDict2

  L1_2 = "reaction@male_stand@big_variations@d"

  L0_2(L1_2)

  L0_2 = nil

  L1_2 = nil

  L2_2 = Citizen

  L2_2 = L2_2.Wait

  L3_2 = 0

  L2_2(L3_2)

  while true do

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = Citizen

    L3_2 = L3_2.Wait

    L4_2 = 50

    L3_2(L4_2)

    L3_2 = GetEntityHeading

    L4_2 = L2_2

    L3_2 = L3_2(L4_2)

    L4_2 = L0_1

    if L4_2 then

      L4_2 = IsPedInAnyVehicle

      L5_2 = L2_2

      L6_2 = true

      L4_2 = L4_2(L5_2, L6_2)

      if not L4_2 then

        local _holster_skip_weapon = false

        L4_2 = GetPedParachuteState

        L5_2 = L2_2

        L4_2 = L4_2(L5_2)

        if -1 ~= L4_2 then

          L4_2 = GetPedParachuteState

          L5_2 = L2_2

          L4_2 = L4_2(L5_2)

          if 0 ~= L4_2 then

            _holster_skip_weapon = true

          end

        end

        if not _holster_skip_weapon then

        L4_2 = IsPedInParachuteFreeFall

        L5_2 = L2_2

        L4_2 = L4_2(L5_2)

        if not L4_2 then

          L4_2 = GetWeapontypeGroup

          L5_2 = GetSelectedPedWeapon

          L6_2 = L2_2

          L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2(L6_2)

          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

          L0_2 = L4_2

          L4_2 = GetSelectedPedWeapon

          L5_2 = PlayerPedId

          L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2()

          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

          L5_2 = CheckWeapon

          L6_2 = L2_2

          L5_2 = L5_2(L6_2)

          if L5_2 then

            if 416676503 == L0_2 or 690389602 == L0_2 then

              L5_2 = L9_1

              if L5_2 then

                L5_2 = L4_1

                if "backhandgun" == L5_2 then

                  blocked = true

                  L5_2 = SetPedCurrentWeaponVisible

                  L6_2 = L2_2

                  L7_2 = 1

                  L8_2 = 1

                  L9_2 = 1

                  L10_2 = 1

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                  L5_2 = TaskPlayAnimAdvanced

                  L6_2 = L2_2

                  L7_2 = "reaction@intimidation@1h"

                  L8_2 = "intro"

                  L9_2 = GetEntityCoords

                  L10_2 = L2_2

                  L11_2 = true

                  L9_2 = L9_2(L10_2, L11_2)

                  L10_2 = 0

                  L11_2 = 0

                  L12_2 = L3_2

                  L13_2 = 8.0

                  L14_2 = 3.0

                  L15_2 = -1

                  L16_2 = 50

                  L17_2 = Config

                  L17_2 = L17_2.AnimationSpeed

                  L17_2 = L17_2.backhandgun

                  L17_2 = L17_2.animSpeed

                  L18_2 = 0

                  L19_2 = 0

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                  L5_2 = Citizen

                  L5_2 = L5_2.Wait

                  L6_2 = Config

                  L6_2 = L6_2.AnimationSpeed

                  L6_2 = L6_2.backhandgun

                  L6_2 = L6_2.clearAnimWait

                  L5_2(L6_2)

                  L5_2 = ClearPedTasks

                  L6_2 = L2_2

                  L5_2(L6_2)

                  L5_2 = false

                  L9_1 = L5_2

                  L5_2 = GetSelectedPedWeapon

                  L6_2 = L2_2

                  L5_2 = L5_2(L6_2)

                  L1_2 = L5_2

                else

                  L5_2 = L4_1

                  if "boxers" == L5_2 then

                    blocked = true

                    L5_2 = SetPedCurrentWeaponVisible

                    L6_2 = L2_2

                    L7_2 = 1

                    L8_2 = 1

                    L9_2 = 1

                    L10_2 = 1

                    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                    L5_2 = TaskPlayAnimAdvanced

                    L6_2 = L2_2

                    L7_2 = "combat@combat_reactions@pistol_1h_gang"

                    L8_2 = "0"

                    L9_2 = GetEntityCoords

                    L10_2 = L2_2

                    L11_2 = true

                    L9_2 = L9_2(L10_2, L11_2)

                    L10_2 = 0

                    L11_2 = 0

                    L12_2 = L3_2

                    L13_2 = 8.0

                    L14_2 = 3.0

                    L15_2 = -1

                    L16_2 = 50

                    L17_2 = Config

                    L17_2 = L17_2.AnimationSpeed

                    L17_2 = L17_2.backhandgun

                    L17_2 = L17_2.animSpeed

                    L18_2 = 0

                    L19_2 = 0

                    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                    L5_2 = Citizen

                    L5_2 = L5_2.Wait

                    L6_2 = Config

                    L6_2 = L6_2.AnimationSpeed

                    L6_2 = L6_2.backhandgun

                    L6_2 = L6_2.clearAnimWait

                    L5_2(L6_2)

                    L5_2 = ClearPedTasks

                    L6_2 = L2_2

                    L5_2(L6_2)

                    L5_2 = false

                    L9_1 = L5_2

                    L5_2 = GetSelectedPedWeapon

                    L6_2 = L2_2

                    L5_2 = L5_2(L6_2)

                    L1_2 = L5_2

                  else

                    L5_2 = L4_1

                    if "chesthandgun" == L5_2 then

                      blocked = true

                      L5_2 = SetPedCurrentWeaponVisible

                      L6_2 = L2_2

                      L7_2 = 1

                      L8_2 = 1

                      L9_2 = 1

                      L10_2 = 1

                      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                      L5_2 = TaskPlayAnimAdvanced

                      L6_2 = L2_2

                      L7_2 = "combat@combat_reactions@pistol_1h_gang"

                      L8_2 = "0"

                      L9_2 = GetEntityCoords

                      L10_2 = L2_2

                      L11_2 = true

                      L9_2 = L9_2(L10_2, L11_2)

                      L10_2 = 0

                      L11_2 = 0

                      L12_2 = L3_2

                      L13_2 = 8.0

                      L14_2 = 3.0

                      L15_2 = -1

                      L16_2 = 50

                      L17_2 = Config

                      L17_2 = L17_2.AnimationSpeed

                      L17_2 = L17_2.backhandgun

                      L17_2 = L17_2.animSpeed

                      L18_2 = 0

                      L19_2 = 0

                      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                      L5_2 = Citizen

                      L5_2 = L5_2.Wait

                      L6_2 = Config

                      L6_2 = L6_2.AnimationSpeed

                      L6_2 = L6_2.backhandgun

                      L6_2 = L6_2.clearAnimWait

                      L5_2(L6_2)

                      L5_2 = ClearPedTasks

                      L6_2 = L2_2

                      L5_2(L6_2)

                      L5_2 = false

                      L9_1 = L5_2

                      L5_2 = GetSelectedPedWeapon

                      L6_2 = L2_2

                      L5_2 = L5_2(L6_2)

                      L1_2 = L5_2

                    else

                      L5_2 = L4_1

                      if "leghandgun" == L5_2 then

                        blocked = true

                        L5_2 = SetPedCurrentWeaponVisible

                        L6_2 = L2_2

                        L7_2 = 1

                        L8_2 = 1

                        L9_2 = 1

                        L10_2 = 1

                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                        L5_2 = TaskPlayAnimAdvanced

                        L6_2 = L2_2

                        L7_2 = "reaction@male_stand@big_variations@d"

                        L8_2 = "react_big_variations_m"

                        L9_2 = GetEntityCoords

                        L10_2 = L2_2

                        L11_2 = true

                        L9_2 = L9_2(L10_2, L11_2)

                        L10_2 = 0

                        L11_2 = 0

                        L12_2 = L3_2

                        L13_2 = 8.0

                        L14_2 = 3.0

                        L15_2 = -1

                        L16_2 = 50

                        L17_2 = Config

                        L17_2 = L17_2.AnimationSpeed

                        L17_2 = L17_2.backhandgun

                        L17_2 = L17_2.animSpeed

                        L18_2 = 0

                        L19_2 = 0

                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                        L5_2 = Citizen

                        L5_2 = L5_2.Wait

                        L6_2 = Config

                        L6_2 = L6_2.AnimationSpeed

                        L6_2 = L6_2.backhandgun

                        L6_2 = L6_2.clearAnimWait

                        L5_2(L6_2)

                        L5_2 = ClearPedTasks

                        L6_2 = L2_2

                        L5_2(L6_2)

                        L5_2 = false

                        L9_1 = L5_2

                        L5_2 = GetSelectedPedWeapon

                        L6_2 = L2_2

                        L5_2 = L5_2(L6_2)

                        L1_2 = L5_2

                      else

                        blocked = true

                        L5_2 = SetPedCurrentWeaponVisible

                        L6_2 = L2_2

                        L7_2 = 0

                        L8_2 = 1

                        L9_2 = 1

                        L10_2 = 1

                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                        L5_2 = SetPedCurrentWeaponVisible

                        L6_2 = L2_2

                        L7_2 = 1

                        L8_2 = 1

                        L9_2 = 1

                        L10_2 = 1

                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                        L5_2 = TaskPlayAnim

                        L6_2 = L2_2

                        L7_2 = "rcmjosh4"

                        L8_2 = "josh_leadout_cop2"

                        L9_2 = 8.0

                        L10_2 = 2.0

                        L11_2 = -1

                        L12_2 = 48

                        L13_2 = 10

                        L14_2 = 0

                        L15_2 = 0

                        L16_2 = 0

                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)

                        L5_2 = Citizen

                        L5_2 = L5_2.Wait

                        L6_2 = Config

                        L6_2 = L6_2.AnimationSpeed

                        L6_2 = L6_2.backhandgun

                        L6_2 = L6_2.clearAnimWait

                        L5_2(L6_2)

                        L5_2 = ClearPedTasks

                        L6_2 = L2_2

                        L5_2(L6_2)

                        L5_2 = false

                        L9_1 = L5_2

                        L5_2 = GetSelectedPedWeapon

                        L6_2 = L2_2

                        L5_2 = L5_2(L6_2)

                        L1_2 = L5_2

                      end

                    end

                  end

                end

              else

                blocked = false

              end

            else

              L5_2 = L9_1

              if L5_2 then

                L5_2 = L5_1

                if "tacticalrifle" == L5_2 then

                  blocked = true

                  L5_2 = SetPedCurrentWeaponVisible

                  L6_2 = L2_2

                  L7_2 = 1

                  L8_2 = 1

                  L9_2 = 1

                  L10_2 = 1

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                  L5_2 = TaskPlayAnimAdvanced

                  L6_2 = L2_2

                  L7_2 = "combat@combat_reactions@pistol_1h_hillbilly"

                  L8_2 = "0"

                  L9_2 = GetEntityCoords

                  L10_2 = L2_2

                  L11_2 = true

                  L9_2 = L9_2(L10_2, L11_2)

                  L10_2 = 0

                  L11_2 = 0

                  L12_2 = L3_2

                  L13_2 = 8.0

                  L14_2 = 3.0

                  L15_2 = -1

                  L16_2 = 50

                  L17_2 = Config

                  L17_2 = L17_2.AnimationSpeed

                  L17_2 = L17_2.backhandgun

                  L17_2 = L17_2.animSpeed

                  L18_2 = 0

                  L19_2 = 0

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                  L5_2 = Citizen

                  L5_2 = L5_2.Wait

                  L6_2 = Config

                  L6_2 = L6_2.AnimationSpeed

                  L6_2 = L6_2.backhandgun

                  L6_2 = L6_2.clearAnimWait

                  L5_2(L6_2)

                  L5_2 = ClearPedTasks

                  L6_2 = L2_2

                  L5_2(L6_2)

                  L5_2 = false

                  L9_1 = L5_2

                  L5_2 = GetSelectedPedWeapon

                  L6_2 = L2_2

                  L5_2 = L5_2(L6_2)

                  L1_2 = L5_2

                else

                  blocked = true

                  L5_2 = SetPedCurrentWeaponVisible

                  L6_2 = L2_2

                  L7_2 = 1

                  L8_2 = 1

                  L9_2 = 1

                  L10_2 = 1

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

                  L5_2 = TaskPlayAnimAdvanced

                  L6_2 = L2_2

                  L7_2 = "reaction@intimidation@1h"

                  L8_2 = "intro"

                  L9_2 = GetEntityCoords

                  L10_2 = L2_2

                  L11_2 = true

                  L9_2 = L9_2(L10_2, L11_2)

                  L10_2 = 0

                  L11_2 = 0

                  L12_2 = L3_2

                  L13_2 = 8.0

                  L14_2 = 3.0

                  L15_2 = -1

                  L16_2 = 50

                  L17_2 = Config

                  L17_2 = L17_2.AnimationSpeed

                  L17_2 = L17_2.backhandgun

                  L17_2 = L17_2.animSpeed

                  L18_2 = 0

                  L19_2 = 0

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                  L5_2 = Citizen

                  L5_2 = L5_2.Wait

                  L6_2 = Config

                  L6_2 = L6_2.AnimationSpeed

                  L6_2 = L6_2.backhandgun

                  L6_2 = L6_2.clearAnimWait

                  L5_2(L6_2)

                  L5_2 = ClearPedTasks

                  L6_2 = L2_2

                  L5_2(L6_2)

                  L5_2 = false

                  L9_1 = L5_2

                  L5_2 = GetSelectedPedWeapon

                  L6_2 = L2_2

                  L5_2 = L5_2(L6_2)

                  L1_2 = L5_2

                end

              else

                blocked = false

              end

            end

          else

            lastWeaponHash = L4_2

            local _holster_no_bh = false

            L5_2 = GetWeapontypeGroup

            L6_2 = L1_2

            L5_2 = L5_2(L6_2)

            if 416676503 ~= L5_2 then

              L5_2 = GetWeapontypeGroup

              L6_2 = L1_2

              L5_2 = L5_2(L6_2)

              if 690389602 ~= L5_2 then

                _holster_no_bh = true

              end

            end

            L5_2 = L9_1

            if not L5_2 then

              L5_2 = L4_1

              if _holster_no_bh or "backhandgun" == L5_2 then

                if not _holster_no_bh then

                L5_2 = TaskPlayAnimAdvanced

                L6_2 = L2_2

                L7_2 = "reaction@intimidation@1h"

                L8_2 = "outro"

                L9_2 = GetEntityCoords

                L10_2 = L2_2

                L11_2 = true

                L9_2 = L9_2(L10_2, L11_2)

                L10_2 = 0

                L11_2 = 0

                L12_2 = L3_2

                L13_2 = 8.0

                L14_2 = 3.0

                L15_2 = -1

                L16_2 = 50

                L17_2 = 0.125

                L18_2 = 0

                L19_2 = 0

                L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                L5_2 = Citizen

                L5_2 = L5_2.Wait

                L6_2 = Config

                L6_2 = L6_2.AnimationSpeed

                L6_2 = L6_2.backhandgun

                L6_2 = L6_2.clearAnimWait

                L5_2(L6_2)

                L5_2 = ClearPedTasks

                L6_2 = L2_2

                L5_2(L6_2)

                L5_2 = true

                L9_1 = L5_2

              else

                L5_2 = L4_1

                if "boxers" == L5_2 then

                  L5_2 = TaskPlayAnimAdvanced

                  L6_2 = L2_2

                  L7_2 = "combat@combat_reactions@pistol_1h_gang"

                  L8_2 = "0"

                  L9_2 = GetEntityCoords

                  L10_2 = L2_2

                  L11_2 = true

                  L9_2 = L9_2(L10_2, L11_2)

                  L10_2 = 0

                  L11_2 = 0

                  L12_2 = L3_2

                  L13_2 = 8.0

                  L14_2 = 3.0

                  L15_2 = -1

                  L16_2 = 50

                  L17_2 = 0.125

                  L18_2 = 0

                  L19_2 = 0

                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                  L5_2 = Citizen

                  L5_2 = L5_2.Wait

                  L6_2 = Config

                  L6_2 = L6_2.AnimationSpeed

                  L6_2 = L6_2.backhandgun

                  L6_2 = L6_2.clearAnimWait

                  L5_2(L6_2)

                  L5_2 = ClearPedTasks

                  L6_2 = L2_2

                  L5_2(L6_2)

                  L5_2 = true

                  L9_1 = L5_2

                else

                  L5_2 = L4_1

                  if "leghandgun" == L5_2 then

                    L5_2 = TaskPlayAnimAdvanced

                    L6_2 = L2_2

                    L7_2 = "reaction@male_stand@big_variations@d"

                    L8_2 = "react_big_variations_m"

                    L9_2 = GetEntityCoords

                    L10_2 = L2_2

                    L11_2 = true

                    L9_2 = L9_2(L10_2, L11_2)

                    L10_2 = 0

                    L11_2 = 0

                    L12_2 = L3_2

                    L13_2 = 8.0

                    L14_2 = 3.0

                    L15_2 = -1

                    L16_2 = 50

                    L17_2 = 0.125

                    L18_2 = 0

                    L19_2 = 0

                    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                    L5_2 = Citizen

                    L5_2 = L5_2.Wait

                    L6_2 = Config

                    L6_2 = L6_2.AnimationSpeed

                    L6_2 = L6_2.backhandgun

                    L6_2 = L6_2.clearAnimWait

                    L5_2(L6_2)

                    L5_2 = ClearPedTasks

                    L6_2 = L2_2

                    L5_2(L6_2)

                    L5_2 = true

                    L9_1 = L5_2

                  else

                    L5_2 = L4_1

                    if "chesthandgun" == L5_2 then

                      L5_2 = TaskPlayAnimAdvanced

                      L6_2 = L2_2

                      L7_2 = "combat@combat_reactions@pistol_1h_gang"

                      L8_2 = "0"

                      L9_2 = GetEntityCoords

                      L10_2 = L2_2

                      L11_2 = true

                      L9_2 = L9_2(L10_2, L11_2)

                      L10_2 = 0

                      L11_2 = 0

                      L12_2 = L3_2

                      L13_2 = 8.0

                      L14_2 = 3.0

                      L15_2 = -1

                      L16_2 = 50

                      L17_2 = 0.125

                      L18_2 = 0

                      L19_2 = 0

                      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                      L5_2 = Citizen

                      L5_2 = L5_2.Wait

                      L6_2 = Config

                      L6_2 = L6_2.AnimationSpeed

                      L6_2 = L6_2.backhandgun

                      L6_2 = L6_2.clearAnimWait

                      L5_2(L6_2)

                      L5_2 = ClearPedTasks

                      L6_2 = L2_2

                      L5_2(L6_2)

                      L5_2 = true

                      L9_1 = L5_2

                    else

                      L5_2 = TaskPlayAnimAdvanced

                      L6_2 = L2_2

                      L7_2 = "reaction@intimidation@cop@unarmed"

                      L8_2 = "outro"

                      L9_2 = GetEntityCoords

                      L10_2 = L2_2

                      L11_2 = true

                      L9_2 = L9_2(L10_2, L11_2)

                      L10_2 = 0

                      L11_2 = 0

                      L12_2 = L3_2

                      L13_2 = 8.0

                      L14_2 = 3.0

                      L15_2 = -1

                      L16_2 = 50

                      L17_2 = 0.125

                      L18_2 = 0

                      L19_2 = 0

                      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                      L5_2 = Citizen

                      L5_2 = L5_2.Wait

                      L6_2 = Config

                      L6_2 = L6_2.AnimationSpeed

                      L6_2 = L6_2.backhandgun

                      L6_2 = L6_2.clearAnimWait

                      L5_2(L6_2)

                      L5_2 = ClearPedTasks

                      L6_2 = L2_2

                      L5_2(L6_2)

                      L5_2 = true

                      L9_1 = L5_2

                      goto lbl_707

                      end

                      L5_2 = L9_1

                      if not L5_2 then

                        L5_2 = L5_1

                        if "tacticalrifle" == L5_2 then

                          L5_2 = TaskPlayAnimAdvanced

                          L6_2 = L2_2

                          L7_2 = "combat@combat_reactions@pistol_1h_gang"

                          L8_2 = "0"

                          L9_2 = GetEntityCoords

                          L10_2 = L2_2

                          L11_2 = true

                          L9_2 = L9_2(L10_2, L11_2)

                          L10_2 = 0

                          L11_2 = 0

                          L12_2 = L3_2

                          L13_2 = 8.0

                          L14_2 = 3.0

                          L15_2 = -1

                          L16_2 = 50

                          L17_2 = 0.125

                          L18_2 = 0

                          L19_2 = 0

                          L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                          L5_2 = Citizen

                          L5_2 = L5_2.Wait

                          L6_2 = Config

                          L6_2 = L6_2.AnimationSpeed

                          L6_2 = L6_2.backhandgun

                          L6_2 = L6_2.clearAnimWait

                          L5_2(L6_2)

                          L5_2 = ClearPedTasks

                          L6_2 = L2_2

                          L5_2(L6_2)

                          L5_2 = true

                          L9_1 = L5_2

                        else

                          L5_2 = TaskPlayAnimAdvanced

                          L6_2 = L2_2

                          L7_2 = "reaction@intimidation@1h"

                          L8_2 = "outro"

                          L9_2 = GetEntityCoords

                          L10_2 = L2_2

                          L11_2 = true

                          L9_2 = L9_2(L10_2, L11_2)

                          L10_2 = 0

                          L11_2 = 0

                          L12_2 = L3_2

                          L13_2 = 8.0

                          L14_2 = 3.0

                          L15_2 = -1

                          L16_2 = 50

                          L17_2 = 0.125

                          L18_2 = 0

                          L19_2 = 0

                          L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                          L5_2 = Citizen

                          L5_2 = L5_2.Wait

                          L6_2 = Config

                          L6_2 = L6_2.AnimationSpeed

                          L6_2 = L6_2.backhandgun

                          L6_2 = L6_2.clearAnimWait

                          L5_2(L6_2)

                          L5_2 = ClearPedTasks

                          L6_2 = L2_2

                          L5_2(L6_2)

                          L5_2 = true

                          L9_1 = L5_2

                        end

                      end

                    end

                  end

                end

              end

            end

          end

        end

        else

          L4_2 = GetVehiclePedIsTryingToEnter

          L5_2 = L2_2

          L4_2 = L4_2(L5_2)

          if 0 == L4_2 then

            L4_2 = false

            L9_1 = L4_2

          else

            L4_2 = SetCurrentPedWeapon

            L5_2 = L2_2

            L6_2 = GetHashKey

            L7_2 = "WEAPON_UNARMED"

            L6_2 = L6_2(L7_2)

            L7_2 = true

            L4_2(L5_2, L6_2, L7_2)

          end

        end

    end

    else

      L4_2 = true

      L9_1 = L4_2

    end

    ::lbl_707::

    L4_2 = L9_1

    if L4_2 then

      L4_2 = Citizen

      L4_2 = L4_2.Wait

      L5_2 = 500

      L4_2(L5_2)

    end

  end

end

L13_1(L14_1)

L13_1 = AddEventHandler

L14_1 = "onResourceStop"

function L15_1(A0_2)

  local L1_2

  L1_2 = GetCurrentResourceName

  L1_2 = L1_2()

  if A0_2 == L1_2 then

    L1_2 = RemoveGears

    L1_2()

  end

end

L13_1(L14_1, L15_1)

