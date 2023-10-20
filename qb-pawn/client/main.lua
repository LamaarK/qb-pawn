local QBCore = exports["qb-core"]:GetCoreObject()
local Player = QBCore.Functions.GetPlayer
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			if PlayerData.job.name == "pawnshop" then
				TriggerServerEvent("QBCore:ToggleDuty")
			end
		end
	end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("qb-pawn:DutyPawn", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

Citizen.CreateThread(function()
    pawn = AddBlipForCoord(174.99, -1320.55, 29.35)
    SetBlipSprite (pawn, 463)
    SetBlipDisplay(pawn, 4)
    SetBlipScale  (pawn, 0.6)
    SetBlipAsShortRange(pawn, true)
    SetBlipColour(pawn, 34)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Pawn Shop")
    EndTextCommandSetBlipName(pawn)
end)

RegisterNetEvent("qb-pawn:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pawntray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pawntray1", {
        maxweight = 10000,
        slots = 8,
    })
end)

RegisterNetEvent("qb-pawn:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pawntray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pawntray2", {
        maxweight = 10000,
        slots = 8,
    })
end)

RegisterNetEvent("qb-pawn:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pawntray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pawntray3", {
        maxweight = 10000,
        slots = 8,
    })
end)

RegisterNetEvent("qb-pawn:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pawnStorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pawnStorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-pawn:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pawnStorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pawnStorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

