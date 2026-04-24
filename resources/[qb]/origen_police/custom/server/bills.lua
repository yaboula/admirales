RegisterServerEvent("origen_police:server:PayBill", function(args)

    local src = source

    local Player = FW_GetPlayer(src)

    if not Player then return end

    local price = tonumber(args.price)
    local billId = tonumber(args.id)

    if not price or price <= 0 or price > 10000000 then
        print("[origen_police][SECURITY] PayBill: precio inválido de src=" .. src .. " price=" .. tostring(args.price))
        return
    end

    if not billId or billId <= 0 then
        print("[origen_police][SECURITY] PayBill: id de factura inválido de src=" .. src)
        return
    end

    if(Player.PlayerData.money.bank < price) then

        TriggerClientEvent('origen_police:ShowNotification', src, "You don't have enough money")

        return

    end

    Player.Functions.RemoveMoney("bank", price, "paid-bill")

    PayBill(billId)

    local societyTarget = args.job

    for _, jobData in pairs(Config.JobCategory) do

        for _, job in pairs(jobData) do

            if job.name == args.job then

                societyTarget = job.society

            end

        end

    end

    AddMoneyToSociety(price, societyTarget)

    CreateLog({

        type = 'Bills',

        embed = {

            title = Config.LogsTranslations.PayBill.title,

            description = Config.LogsTranslations.PayBill.message:format(price, billId),

            color = 0x1B55BF,

        },

        source = src,

    })

end)

