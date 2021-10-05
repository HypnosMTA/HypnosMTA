sunucu = "[Hypnos]"

function msg(msg,r,g,b)
	outputChatBox(sunucu..": #FFFFFF"..msg, r,g,b,true)
end

function cmd(cmd, ...)
	mesaj = table.concat({...}, " ")
	msg(mesaj, 255, 0, 0)
end
addCommandHandler("kmt", cmd)

