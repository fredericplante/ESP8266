local id = 0
local Nom_du_module = ...
local M = {}
_G[Nom_du_module] = M

local function decToBcd(valeur)

	return((valeur/10*16) + (valeur%10))

end

local function bcdToDec(valeur)

	return((valeur/16*10) + (valeur%16))
	
end

function M.init(d, l, a)

	sda = d
	scl = l
	device = a
	if (i2c.setup(id, sda, scl, i2c.SLOW)) ~= 0 then print("La configuration du port I2C s'est fait correctement")
	elseif (i2c.setup(id, sda, scl, i2c.SLOW)) == 0 then  print("Erreur dans la configuration du port I2C!") return nil
	end
	
end

function M.obtenir_heure()

	i2c.start(id)
	i2c.address(id, device, i2c.TRANSMITTER)
	i2c.write(id, 0x00)
	i2c.stop(id)

	i2c.start(id)
	i2c.address(id, device, i2c.RECEIVER)
	local c = i2c.read(id, 7)
	i2c.stop(id)

	return bcdToDec(tonumber(string.byte(c, 1))),

	bcdToDec(tonumber(string.byte(c, 2))),
	bcdToDec(tonumber(string.byte(c, 3))),
	bcdToDec(tonumber(string.byte(c, 4))),
	bcdToDec(tonumber(string.byte(c, 5))),
	bcdToDec(tonumber(string.byte(c, 6))),
	bcdToDec(tonumber(string.byte(c, 7)))

end

function M.configurer_heure(seconde, minute, heure, jour, date, mois, annee)

	i2c.start(id)
	i2c.address(id, device, i2c.TRANSMITTER)
	i2c.write(id, 0x00)
	i2c.write(id, decToBcd(seconde))
	i2c.write(id, decToBcd(minute))
	i2c.write(id, decToBcd(heure))
	i2c.write(id, decToBcd(jour))
	i2c.write(id, decToBcd(date))
	i2c.write(id, decToBcd(mois))
	i2c.write(id, decToBcd(annee))
	i2c.stop(id)

end

return M
