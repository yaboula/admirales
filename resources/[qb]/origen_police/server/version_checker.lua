local L0_1, L1_1

L0_1 = Config

L0_1 = L0_1.CheckVersions

if not L0_1 then

  return

end

L0_1 = CreateThread

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = Wait

  L1_2 = 5000

  L0_2(L1_2)

  function L0_2(A0_3)

    local L1_3, L2_3

    L1_3 = tonumber

    L2_3 = A0_3

    return L1_3(L2_3)

  end

  L1_2 = GetCurrentResourceName

  L1_2 = L1_2()

  if "origen_police" ~= L1_2 then

    while true do

      L2_2 = print

      L3_2 = "^1[Origen Police] - The resource name is not correct, please change it to \"origen_police\".^0"

      L2_2(L3_2)

      L2_2 = Wait

      L3_2 = 1000

      L2_2(L3_2)

    end

  end

  L2_2 = GetResourceMetadata

  L3_2 = L1_2

  L4_2 = "version"

  L5_2 = 0

  L2_2 = L2_2(L3_2, L4_2, L5_2)

  L3_2 = PerformHttpRequest

  L4_2 = "https://raw.githubusercontent.com/ElOrigenCompanyES/ScriptsVersions/master/"

  L5_2 = L1_2

  L6_2 = ".txt"

  L4_2 = L4_2 .. L5_2 .. L6_2

  function L5_2(A0_3, A1_3, A2_3)

    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3

    if not A1_3 then

      L3_3 = print

      L4_3 = "^1The version check failed, GitHub may be down.^0"

      return L3_3(L4_3)

    end

    L3_3 = json

    L3_3 = L3_3.decode

    L5_3 = A1_3

    L4_3 = A1_3.sub

    L6_3 = 1

    L7_3 = -2

    L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3 = L4_3(L5_3, L6_3, L7_3)

    L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)

    A1_3 = L3_3

    L3_3 = L0_2

    L4_3 = A1_3.version

    L5_3 = L4_3

    L4_3 = L4_3.gsub

    L6_3 = "%."

    L7_3 = ""

    L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3 = L4_3(L5_3, L6_3, L7_3)

    L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)

    L4_3 = L0_2

    L5_3 = L2_2

    L6_3 = L5_3

    L5_3 = L5_3.gsub

    L7_3 = "%."

    L8_3 = ""

    L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3 = L5_3(L6_3, L7_3, L8_3)

    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)

    if L3_3 > L4_3 then

      L5_3 = "^9"

      L6_3 = 1

      L7_3 = L1_2

      L7_3 = #L7_3

      L7_3 = L7_3 * 2

      L7_3 = 26 + L7_3

      L8_3 = 1

      for L9_3 = L6_3, L7_3, L8_3 do

        L10_3 = L5_3

        L11_3 = "-"

        L10_3 = L10_3 .. L11_3

        L5_3 = L10_3

      end

      L6_3 = L5_3

      L7_3 = "^0"

      L6_3 = L6_3 .. L7_3

      L5_3 = L6_3

      L6_3 = print

      L7_3 = L5_3

      L6_3(L7_3)

      L6_3 = print

      L7_3 = [[

^3[Origen Police] - New update available now!^0

Current Version: ^1]]

      L8_3 = L2_2

      L9_3 = [[

^0.

New Version: ^2]]

      L10_3 = A1_3.version

      L11_3 = "^0."

      L7_3 = L7_3 .. L8_3 .. L9_3 .. L10_3 .. L11_3

      L6_3(L7_3)

      L6_3 = A1_3.updates

      if L6_3 then

        L6_3 = ipairs

        L7_3 = A1_3.updates

        L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)

        for L10_3, L11_3 in L6_3, L7_3, L8_3, L9_3 do

          L12_3 = print

          L13_3 = "^2   - "

          L14_3 = L11_3

          L15_3 = "^0"

          L13_3 = L13_3 .. L14_3 .. L15_3

          L12_3(L13_3)

        end

      else

        L6_3 = print

        L7_3 = "^2No news available^0"

        L6_3(L7_3)

      end

      L6_3 = print

      L7_3 = [[

^5Download it now on your keymaster.fivem.net^0.]]

      L6_3(L7_3)

      L6_3 = print

      L7_3 = L5_3

      L6_3(L7_3)

    end

  end

  L6_2 = "GET"

  L7_2 = ""

  L8_2 = {}

  L8_2["Content-Type"] = "application/json"

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1)

