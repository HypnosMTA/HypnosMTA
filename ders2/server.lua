sunucu = "[Hypnos]"

function msg(msg,oyuncu,r,g,b)
	outputChatBox(sunucu..": #FFFFFF"..msg,oyuncu, r,g,b,true)
end

function duyuruuseful(msg,oyuncu,r,g,b)
	sayi = 4
	for s, o in ipairs(getElementsByType("player")) do
		outputChatBox(sunucu..": #FFFFFF"..msg,o, r,g,b,true)
		sayi = sayi + 1
	end
	print(sayi)
end

function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

marker = {
[1] = {x = 2838.138671875, y = -1977.1328125, z = 10.9375},
[2] = {x = 2839.5537109375, y = -1876.1884765625, z = 10.934103012085},
[3] = {x = 2847.0595703125, y = -1809.40234375, z = 10.9375},
[4] = {x = 2868.0771484375, y = -1693.5830078125, z = 10.88272857666},
[5] = {x = 2838.138671875, y = -1977.1328125, z = 10.9375},
[6] = {x = 2851.107421875, y = -1676.5478515625, z = 10.9375},
[7] = {x = 2824.1318359375, y = -1846.6796875, z = 10.9375},
[8] = {x = 2849.044921875, y = -1892.6083984375, z = 10.9375},
[9] = {x = 2862.5478515625, y = -1983.7841796875, z = 10.9375},
[10] = {x = 2890.8410644531, y = -1993.458984375, z = 10.9375}
}

para = {1000, 2000, 5000, 2500, 3500, 4500}
startcol = createColSphere(marker[10].x, marker[10].y, marker[10].z, 4)

playermarker = {}
start = function(player)
	if isElementWithinColShape(player, startcol) then
		msg("Mesleğe başarıyla başladın!, git aracı al ve yolları temizle.",player, 255, 255, 0)
		setElementData(player, "clearjob", true)
		hypnos = 0
		for s, v in ipairs(marker) do 
			hypnos = s
			s = createMarker(v.x, v.y, v.z, "cylinder", 2, 255, 255, 0, 150)
			marker[s] = hypnos
			playermarker = {}
			addEventHandler("onMarkerHit", root, function()
				veh = getPedOccupiedVehicle(player)
				if veh and getElementModel(veh) == 411 then 
					if playermarker[player] then
						if tonumber(playermarker[player]) == marker[s] then 
							playermarker[player] = playermarker[player] + 1 
							destroyElement(s)
							if marker[s] == 10 then 
								msg("Mesleği başarıyla bitirdin!",player, 255, 255, 0)
								exports.wild_global:giveMoney(player,table.random(para)) 
							end
						end
					else 
						if marker[s] == 1 then 
							playermarker[player] = 2
							destroyElement(s)
						end
					end
				end
			end)
		end
	else 
		msg("Bu mesleğe başlamak için doğru yerde değilsin!", player, 255, 255, 0)
	end
end
addCommandHandler("basla", start)


-- Örnekler --
-- ders = {"1", "mehmet", "ahmet", "4", "5"}
-- deneme = {}

-- deneme[1] = "a"
-- deneme[2] = "b"
-- deneme[3] = "c"
-- deneme["hypnos"] = "olgun"

-- for s, v in pairs (deneme) do 
	-- print(s,v)
-- end

-- table.insert(ders, 2, "Olgun")
-- table.remove(ders, 2)
-- hypnos = 0
-- for s, v in ipairs (ders) do 
	-- hypnos = s
	-- print(s..". veri "..v)
-- end
-- print("Toplam "..hypnos.." veri vardi.")
-- print(table.random(ders))
-- yazdir = table.concat(ders, ", ")
-- print(yazdir)