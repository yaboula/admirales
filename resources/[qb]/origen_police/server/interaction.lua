local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

L0_1 = {}

L1_1 = RegisterServerAction

L2_1 = "origen_police:server:cuffuncuffplayer"

function L3_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  if A0_2 then

    L1_2 = source

    if L1_2 then

      goto lbl_7

    end

  end

  do return end

  ::lbl_7::

  L1_2 = tonumber

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L2_2 = L0_1

  L2_2[L1_2] = true

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:client:setcuffstate"

  L3_2 = A0_2

  L4_2 = source

  L1_2(L2_2, L3_2, L4_2)

end

L4_1 = "handcuff"

L5_1 = 300

L6_1 = 1

L7_1 = Config

L7_1 = L7_1.HandCuff

L7_1 = L7_1.AllowAllJobs

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:playcuffanim"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  if A0_2 then

    L2_2 = source

    if L2_2 then

      goto lbl_7

    end

  end

  do return end

  ::lbl_7::

  L2_2 = tonumber

  L3_2 = source

  L2_2 = L2_2(L3_2)

  L3_2 = L0_1

  L2_2 = L3_2[L2_2]

  if not L2_2 then

    L2_2 = BanPlayer

    L3_2 = source

    L4_2 = "Hook action detect not valid pending cuff state"

    L2_2(L3_2, L4_2)

    return

  end

  if -1 == A0_2 then

    L2_2 = BanPlayer

    L3_2 = source

    L4_2 = "Hook action with invalid source value in cuff animation"

    L2_2(L3_2, L4_2)

    return

  end

  L2_2 = GetEntityCoords

  L3_2 = GetPlayerPed

  L4_2 = source

  L3_2, L4_2, L5_2 = L3_2(L4_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2)

  L3_2 = GetEntityCoords

  L4_2 = GetPlayerPed

  L5_2 = A0_2

  L4_2, L5_2 = L4_2(L5_2)

  L3_2 = L3_2(L4_2, L5_2)

  L2_2 = L2_2 - L3_2

  L2_2 = #L2_2

  if L2_2 > 20.0 then

    L2_2 = BanPlayer

    L3_2 = source

    L4_2 = "Hook action detect too far distance in cuff animation"

    L2_2(L3_2, L4_2)

    return

  end

  L2_2 = L0_1

  L2_2[A0_2] = nil

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:playarrestanim"

  L4_2 = A0_2

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:playarrestedanim"

  L4_2 = source

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterServerAction

L2_1 = "origen_police:server:dragplayer"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  if A0_2 then

    L2_2 = source

    if L2_2 then

      goto lbl_7

    end

  end

  do return end

  ::lbl_7::

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:setdragstate"

  L4_2 = A0_2

  L5_2 = A1_2

  L6_2 = source

  L2_2(L3_2, L4_2, L5_2, L6_2)

end

L4_1 = "drag"

L5_1 = 300

L6_1 = 1

L7_1 = Config

L7_1 = L7_1.Actions

L7_1 = L7_1.AllowAllJobsDrag

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

L1_1 = RegisterServerAction

L2_1 = "origen_police:server:vehicleinof"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = source

  if not L3_2 then

    return

  end

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:statevehicleinof"

  L5_2 = A0_2

  L6_2 = A1_2

  L7_2 = A2_2

  L3_2(L4_2, L5_2, L6_2, L7_2)

end

L4_1 = "putinvehicle"

L5_1 = 500

L6_1 = 1

L7_1 = Config

L7_1 = L7_1.Actions

L7_1 = L7_1.AllowAllJobsPutInVehicle

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

L1_1 = RegisterServerAction

L2_1 = "origen_police:server:attachPlayer"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = source

  if not L2_2 then

    return

  end

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:doAnimation"

  L4_2 = source

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:getDragged"

  L4_2 = A0_2

  L5_2 = source

  L6_2 = A1_2

  L2_2(L3_2, L4_2, L5_2, L6_2)

end

L4_1 = "putinvehicle"

L5_1 = 500

L6_1 = 1

L7_1 = Config

L7_1 = L7_1.Actions

L7_1 = L7_1.AllowAllJobsAttachPlayer

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

