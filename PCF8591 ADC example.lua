require("PCF8591")

PCF8591.init(3, 4, 0x48 )

i = 1
dir = 1

	for i=0,10 do

		resultat = PCF8591.lire_registre(0x00)
		print("Resultat: " .. string.byte(resultat, 1) .. " " .. string.byte(resultat, 2).. " " .. string.byte(resultat, 3) .. " " .. string.byte(resultat, 4))
		tmr.delay(250000)
		tmr.wdclr()
    
	end
	
PCF8591 = nil
package.loaded["PCF8591"]=nil
