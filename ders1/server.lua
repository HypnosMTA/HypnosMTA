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

function cmd(oyuncu,cmd, ...)
	mesaj = table.concat({...}, " ")
	msg(mesaj,oyuncu, 255, 0, 0)
end
addCommandHandler("kmtserver", cmd)

function duyuru(oyuncu,cmd, ...)
	mesaj = table.concat({...}, " ")
	duyuruuseful(mesaj,oyuncu, 255, 0, 0)
end
addCommandHandler("duyuru", duyuru)

