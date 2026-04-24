local L0_1, L1_1, L2_1, L3_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  if A0_2 then

    L1_2 = type

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if "table" == L1_2 then

      goto lbl_9

    end

  end

  do return end

  ::lbl_9::

  L1_2 = A0_2.title

  if not L1_2 then

    L1_2 = A0_2.message

    if not L1_2 then

      L1_2 = A0_2.description

      if not L1_2 then

        return

      end

    end

  end

  L1_2 = A0_2.sound

  if not L1_2 then

    L2_2 = Config

    L2_2 = L2_2.notify

    L2_2 = L2_2.play_sound

    if L2_2 then

      L2_2 = A0_2.type

      if L2_2 then

        L2_2 = Config

        L2_2 = L2_2.notify

        L2_2 = L2_2.default_sound

        L3_2 = A0_2.type

        L2_2 = L2_2[L3_2]

        if L2_2 then

          L3_2 = L2_2.set

          if "" ~= L3_2 then

            L3_2 = L2_2.name

            if "" ~= L3_2 then

              L1_2 = L2_2

            end

          end

        end

      end

    end

  end

  A0_2.sound = nil

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "showNotification"

  L3_2.data = A0_2

  L2_2(L3_2)

  if L1_2 then

    L2_2 = L1_2.bank

    if L2_2 then

      L2_2 = L1_2.bank

      if "" ~= L2_2 then

        L2_2 = RequestScriptAudioBank

        L3_2 = L1_2.bank

        L4_2 = false

        L2_2(L3_2, L4_2)

      end

    end

    L2_2 = GetSoundId

    L2_2 = L2_2()

    L3_2 = PlaySoundFrontend

    L4_2 = L2_2

    L5_2 = L1_2.name

    L6_2 = L1_2.set

    L7_2 = true

    L3_2(L4_2, L5_2, L6_2, L7_2)

    L3_2 = ReleaseSoundId

    L4_2 = L2_2

    L3_2(L4_2)

    L3_2 = L1_2.bank

    if L3_2 then

      L3_2 = L1_2.bank

      if "" ~= L3_2 then

        L3_2 = ReleaseNamedScriptAudioBank

        L4_2 = L1_2.bank

        L3_2(L4_2)

      end

    end

  end

end

L1_1 = RegisterNetEvent

L2_1 = "lation_ui:notify"

L3_1 = L0_1

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "notify"

L3_1 = L0_1

L1_1(L2_1, L3_1)









