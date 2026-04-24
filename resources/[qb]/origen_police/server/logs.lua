local L0_1, L1_1, L2_1

function L0_1(A0_2)

  local L1_2

  L1_2 = "" ~= A0_2 and "YOUR_DISCORD_WEBHOOK" ~= A0_2

  return L1_2

end

isValidURL = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L1_2 = ServerConfig

  function L2_2(A0_3, A1_3)

    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

    if nil == A1_3 then

      A1_3 = "%s"

    end

    L2_3 = {}

    L3_3 = string

    L3_3 = L3_3.gmatch

    L4_3 = A0_3

    L5_3 = "([^"

    L6_3 = A1_3

    L7_3 = "]+)"

    L5_3 = L5_3 .. L6_3 .. L7_3

    L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3, L5_3)

    for L7_3 in L3_3, L4_3, L5_3, L6_3 do

      L8_3 = table

      L8_3 = L8_3.insert

      L9_3 = L2_3

      L10_3 = L7_3

      L8_3(L9_3, L10_3)

    end

    return L2_3

  end

  L3_2 = A0_2.type

  if L3_2 then

    L3_2 = L1_2.Logs

    L4_2 = A0_2.type

    L3_2 = L3_2[L4_2]

    if L3_2 then

      L3_2 = isValidURL

      L4_2 = L1_2.Logs

      L5_2 = A0_2.type

      L4_2 = L4_2[L5_2]

      L3_2 = L3_2(L4_2)

      if L3_2 then

        L3_2 = L1_2.UseIdentifiers

        if L3_2 then

          L3_2 = A0_2.source

          if L3_2 then

            L3_2 = "**"

            L4_2 = Config

            L4_2 = L4_2.LogsTranslations

            L4_2 = L4_2.Identifiers

            L5_2 = "**"

            L3_2 = L3_2 .. L4_2 .. L5_2

            L4_2 = tonumber

            L5_2 = A0_2.source

            L4_2 = L4_2(L5_2)

            if L4_2 then

              L4_2 = tonumber

              L5_2 = A0_2.source

              L4_2 = L4_2(L5_2)

              L5_2 = 65000

              if L4_2 < L5_2 then

                L4_2 = L3_2

                L5_2 = "\n"

                L6_2 = Config

                L6_2 = L6_2.LogsTranslations

                L6_2 = L6_2.ID

                L7_2 = ": "

                L8_2 = A0_2.source

                L9_2 = "\n"

                L10_2 = Config

                L10_2 = L10_2.LogsTranslations

                L10_2 = L10_2.Name

                L11_2 = ": "

                L12_2 = GetPlayerName

                L13_2 = A0_2.source

                L12_2 = L12_2(L13_2)

                L13_2 = "\n"

                L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2

                L3_2 = L4_2

            end

            else

              L4_2 = L3_2

              L5_2 = "\n"

              L6_2 = Config

              L6_2 = L6_2.LogsTranslations

              L6_2 = L6_2.ID

              L7_2 = ": _It hasn't loaded yet_"

              L8_2 = "\n"

              L9_2 = Config

              L9_2 = L9_2.LogsTranslations

              L9_2 = L9_2.Name

              L10_2 = ": "

              L11_2 = GetPlayerName

              L12_2 = A0_2.source

              L11_2 = L11_2(L12_2)

              if not L11_2 then

                L11_2 = "_It hasn't loaded yet_"

              end

              L12_2 = "\n"

              L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2

              L3_2 = L4_2

            end

            L4_2 = A0_2.source

            if not L4_2 then

            else

              L4_2 = pairs

              L5_2 = GetPlayerIdentifiers

              L6_2 = A0_2.source

              L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2)

              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

                L10_2 = string

                L10_2 = L10_2.find

                L11_2 = L9_2

                L12_2 = "license2:"

                L10_2 = L10_2(L11_2, L12_2)

                if not L10_2 then

                  L10_2 = string

                  L10_2 = L10_2.find

                  L11_2 = L9_2

                  L12_2 = "ip:"

                  L10_2 = L10_2(L11_2, L12_2)

                  if not L10_2 then

                    L10_2 = L3_2

                    L11_2 = L2_2

                    L12_2 = L9_2

                    L13_2 = ":"

                    L11_2 = L11_2(L12_2, L13_2)

                    L11_2 = L11_2[1]

                    L12_2 = ": "

                    L13_2 = L9_2

                    L14_2 = "\n"

                    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2

                    L3_2 = L10_2

                  end

                end

              end

            end

            L4_2 = A0_2.embed

            if L4_2 then

              L4_2 = A0_2.embed

              L5_2 = A0_2.embed

              L5_2 = L5_2.description

              if L5_2 then

                L5_2 = A0_2.embed

                L5_2 = L5_2.description

                L6_2 = [[

]]

                L5_2 = L5_2 .. L6_2

                if L5_2 then

                  goto lbl_133

                end

              end

              L5_2 = ""

              ::lbl_133::

              L6_2 = L3_2

              L5_2 = L5_2 .. L6_2

              L4_2.description = L5_2

            else

              L4_2 = A0_2.message

              if L4_2 then

                L4_2 = A0_2.message

                L5_2 = [[

]]

                L4_2 = L4_2 .. L5_2

                if L4_2 then

                  goto lbl_146

                end

              end

              L4_2 = ""

              ::lbl_146::

              L5_2 = L3_2

              L4_2 = L4_2 .. L5_2

              A0_2.message = L4_2

            end

          end

        end

        L3_2 = PerformHttpRequest

        L4_2 = L1_2.Logs

        L5_2 = A0_2.type

        L4_2 = L4_2[L5_2]

        function L5_2(A0_3, A1_3, A2_3)

        end

        L6_2 = "POST"

        L7_2 = json

        L7_2 = L7_2.encode

        L8_2 = {}

        L9_2 = A0_2.embed

        if L9_2 then

          L9_2 = {}

          L10_2 = A0_2.embed

          L9_2[1] = L10_2

          if L9_2 then

            goto lbl_170

          end

        end

        L9_2 = {}

        ::lbl_170::

        L8_2.embeds = L9_2

        L9_2 = A0_2.avatar_url

        if not L9_2 then

          L9_2 = ""

        end

        L8_2.avatar_url = L9_2

        L9_2 = A0_2.message

        if not L9_2 then

          L9_2 = ""

        end

        L8_2.content = L9_2

        L7_2 = L7_2(L8_2)

        L8_2 = {}

        L8_2["Content-Type"] = "application/json"

        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

    end

  end

  else

    L3_2 = Debuger

    L4_2 = "^1This type of log does not exist or has not been configured.^0"

    L5_2 = A0_2.type

    L3_2(L4_2, L5_2)

    L3_2 = Debuger

    L4_2 = "^2PLEASE READ!!^1You need to set your discord webhook in config/logs/logs.lua^0We don't give support for this error, just set the webhook and the error will be fixed^0"

    L3_2(L4_2)

  end

end

CreateLog = L0_1

L0_1 = exports

L1_1 = "CreateLog"

L2_1 = CreateLog

L0_1(L1_1, L2_1)

