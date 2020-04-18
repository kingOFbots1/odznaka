function getnumer(source)
	
    local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM numery WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
    	return true
    end

end

RegisterServerEvent("nadajodznake")
AddEventHandler("nadajodznake", function(id, number)
		local sprawdzczyjuzma = getnumer(id)
		local nadajaca = source
		if sprawdzczyjuzma == true then
			return TriggerClientEvent('esx:showNotification', source, '~y~'..GetPlayerName(id)..' posiada już odznake!')
        end
        if GetPlayerIdentifiers(id)[1] == nil then
        	return TriggerClientEvent('esx:showNotification', source, 'Nie ma takiego ~r~gracza ~w~na serwerze!')
        end
        MySQL.Async.execute("INSERT INTO numery (identifier, number) VALUES(@identifier, @number)",     

    {["@identifier"] = GetPlayerIdentifiers(id)[1], 
    ["@number"] = number},

        function (result)
	end)
			TriggerClientEvent('esx:showNotification', source, 'Nadałes odznake dla ~y~' ..GetPlayerName(id).. '~w~ o numerze odznaki: ~b~'..number)
			TriggerClientEvent('esx:showNotification', id, 'Otrzymałeś numer odznaki: ~b~'..number)


end)
