json = require("json/dkjson")

ip = "http://localhost:8082/"

function sendRequest(address)
	print("Sending: " .. address)
	CreateHTTPRequest("GET", address):Send(function (response)
			print( "GET response:\n" )
			for k,v in pairs( response ) do
				print( string.format( "%s : %s\n", k, v ) )
			end
		end)
end

function gotLastHit (eventHandler)
	local lastHitTable = {}
	lastHitTable.EventName = "LastHit"
	lastHitTable.HeroID = eventHandler.PlayerID

	print("player ID: " .. eventHandler.PlayerID .. ", killed Unit ID: " .. eventHandler.EntKilled)

	local jsonTable = json.encode(lastHitTable)
	local address =  ip .. jsonTable
	sendRequest(address)
	CreateHTTPRequest("GET", address):Send(function (response)
		end)
end

function heroPicked (eventHandler)
	local SpawnTable = {}
	SpawnTable.EventName = "HeroPicked"
	SpawnTable.HeroID = eventHandler.heroindex
	local hero = EntIndexToHScript(eventHandler.heroindex) 
	local jsonTable = json.encode(SpawnTable)
	local adress = ip .. jsonTable
	sendRequest(adress)
	print("Hero ID: " .. eventHandler.heroindex .. "Buyback costs: " .. hero:GetBuybackCost() )
end 
