require("PCF8591")

PCF8591.init(3, 4, 0x48 )

i = 1
dir = 1
nb = 0

while(nb ~= 10 )do
 
	dir = (i == 0) and (dir == -1) and 1 or (i == 180) and (dir == 1) and -1 or dir
	i = i + dir 
	if (i == 180) then nb = nb + 1 end
	PCF8591.ecrire_registre(0x40, i)
	tmr.delay(2500)
	tmr.wdclr()

end

PCF8591 = nil
package.loaded["PCF8591"]=nil
