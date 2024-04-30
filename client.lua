-- ███████╗██████╗ ██╗    ██╗██╗███╗   ██╗     █████╗ ███╗   ██╗████████╗██╗██████╗  █████╗ ██████╗  ██████╗ ██████╗ ██████╗ 
-- ██╔════╝██╔══██╗██║    ██║██║████╗  ██║    ██╔══██╗████╗  ██║╚══██╔══╝██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗
-- █████╗  ██║  ██║██║ █╗ ██║██║██╔██╗ ██║    ███████║██╔██╗ ██║   ██║   ██║██████╔╝███████║██║  ██║██║     ██║   ██║██████╔╝
-- ██╔══╝  ██║  ██║██║███╗██║██║██║╚██╗██║    ██╔══██║██║╚██╗██║   ██║   ██║██╔══██╗██╔══██║██║  ██║██║     ██║   ██║██╔═══╝ 
-- ███████╗██████╔╝╚███╔███╔╝██║██║ ╚████║    ██║  ██║██║ ╚████║   ██║   ██║██████╔╝██║  ██║██████╔╝╚██████╗╚██████╔╝██║     
-- ╚══════╝╚═════╝  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     

QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        id = PlayerId()
        DisablePlayerVehicleRewards(id)
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    isPlayerWhitelisted = PlayerWhitelisted()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData = QBCore.Functions.GetPlayerData()
    isPlayerWhitelisted = PlayerWhitelisted()
end)

Weapons = {
    "weapon_ufkpdw",
    "weapon_ufkltl",
    "weapon_mp9",
    "weapon_m4",
    "weapon_mp5",
    "weapon_scarh",
    "weapon_ar15",
    "weapon_nightstick"
}

Jobs = {
    "police",
    "fbi",
    "state",
    "sheriff",
    "ranger",
    "sandys",
    "vespucci",
    "davison"
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        local player = PlayerPedId()
        if not isPlayerWhitelisted then
            for k,v in pairs(Weapons) do
                local player = PlayerPedId()
                local weapon = GetHashKey(v)
                if HasPedGotWeapon(player, weapon, false) then
                    RemoveWeaponFromPed(player, weapon)
                    TriggerServerEvent("antibadcop:server:RemoveItem", v, 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v], "remove", 1) 
                end
            end
        end
    end
end)

function PlayerWhitelisted()
	for k,v in ipairs(Jobs) do
		if v == PlayerData.job.name then
			return true
		end
	end
	return false
end

-- ███████╗██████╗ ██╗    ██╗██╗███╗   ██╗     █████╗ ███╗   ██╗████████╗██╗██████╗  █████╗ ██████╗  ██████╗ ██████╗ ██████╗ 
-- ██╔════╝██╔══██╗██║    ██║██║████╗  ██║    ██╔══██╗████╗  ██║╚══██╔══╝██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗
-- █████╗  ██║  ██║██║ █╗ ██║██║██╔██╗ ██║    ███████║██╔██╗ ██║   ██║   ██║██████╔╝███████║██║  ██║██║     ██║   ██║██████╔╝
-- ██╔══╝  ██║  ██║██║███╗██║██║██║╚██╗██║    ██╔══██║██║╚██╗██║   ██║   ██║██╔══██╗██╔══██║██║  ██║██║     ██║   ██║██╔═══╝ 
-- ███████╗██████╔╝╚███╔███╔╝██║██║ ╚████║    ██║  ██║██║ ╚████║   ██║   ██║██████╔╝██║  ██║██████╔╝╚██████╗╚██████╔╝██║     
-- ╚══════╝╚═════╝  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     
