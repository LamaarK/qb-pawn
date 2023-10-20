QBCore = exports["qb-core"]:GetCoreObject()

--Billing--
RegisterServerEvent("qb-pawn:bill:player", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'pawnshop' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)',
                    {
                        ['citizenid'] = billed.PlayerData.citizenid,
                        ['amount'] = amount,
                        ['society'] = biller.PlayerData.job.name,
                        ['sender'] = biller.PlayerData.charinfo.firstname
                    })
                end
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'pawn')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received', 'pawn')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'pawn')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'pawn')
    end
end)