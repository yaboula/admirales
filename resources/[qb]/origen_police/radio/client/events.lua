local L0_1, L1_1, L2_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:talking"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  if A1_2 then

    L2_2 = Radio

    L2_2 = L2_2.Enabled

    if not L2_2 then

      L2_2 = Radio

      L2_2 = L2_2.MultiFrec

      if "none" == L2_2 then

        goto lbl_15

      end

    end

  end

  L2_2 = Radio

  L2_2 = L2_2.Muted

  ::lbl_15::

  if L2_2 then

    return

  end

  L2_2 = ToggleVoice

  L3_2 = A0_2

  L4_2 = A1_2

  L5_2 = "radio"

  L2_2(L3_2, L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:OnPlayerLoaded"

function L2_1()

  local L0_2, L1_2

  L0_2 = LoadPlayer

  L0_2()

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:OnPlayerUnload"

function L2_1()

  local L0_2, L1_2

  L0_2 = UnLoadPlayer

  L0_2()

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "qb-ambulancejob:onplayerdeath"

function L2_1(A0_2)

  local L1_2, L2_2

  L1_2 = Toggle

  L2_2 = false

  L1_2(L2_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "esx:onPlayerDeath"

function L2_1(A0_2)

  local L1_2, L2_2

  L1_2 = Toggle

  L2_2 = false

  L1_2(L2_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "esx_ambulancejob:revive"

function L2_1()

  local L0_2, L1_2

  L0_2 = Toggle

  L1_2 = true

  L0_2(L1_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:TakeDropRadio"

function L2_1(A0_2)

  local L1_2, L2_2

  if not A0_2 then

    L1_2 = Toggle

    L2_2 = false

    L1_2(L2_2)

    L1_2 = SendNUIMessage

    L2_2 = {}

    L2_2.action = "DisconnectAllFreqs"

    L1_2(L2_2)

  end

end

L0_1(L1_1, L2_1)

