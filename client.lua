Citizen.CreateThread(function()
	while true do
        local interval = 1
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(730.68, 1272.80, 360.29)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 30 then
            local interval = 200
        else
            local interval = 1
            local posDrawMarker = vector3(730.68, 1272.80, 360.29)
            
            DrawMarker(2, posDrawMarker.x, posDrawMarker.y, posDrawMarker.y, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
            if distance < 30 then
                AddTextEntry(("HELP"), "Appuyez sur ~INPUT_CONTEXT~ ~s~pour vosu TP.")
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    local ped = PlayerPedId()
                    local PointTP = vector3(1, 1, 1) -- La où vous voulez vous téléporter.
                    SetEntityCoords(ped, PointTP.x, PointTP.y, PointTP.z, false, false, false, false)
                    local invincible = true -- Mettre sur true si vous voulez qu'il soit invincible.
                    local pedName = "cs_orleans" -- Personnage à choisir sur le site de https://docs.fivem.net/docs/game-references/ped-models/
                    -------------------------------------------------
                    local pedHash = GetHashKey(pedName)
                    local ped2 = CreatePed(9, pedHash, pos.x, pos.y, pos.z, heading, true, false)
                    
                    SetEntityInvincible(ped2, invincible)
                    SetBlockingOfNonTemporaryEvents(ped2, true)
        
                    FreezeEntityPosition(ped2, true)
                end
            end
        end

        Citizen.Wait(interval)
	end
end)