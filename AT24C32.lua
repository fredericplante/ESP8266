local id = 0
local Nom_du_module = ...
local M = {}
_G[Nom_du_module] = M

function M.init(d, l, a)

	sda = d
	scl = l
	device = a
	if (i2c.setup(id, sda, scl, i2c.SLOW)) ~= 0 then print("La configuration du port I2C s'est fait correctement")
	elseif (i2c.setup(id, sda, scl, i2c.SLOW)) == 0 then  print("Erreur dans la configuration du port I2C!") return nil
	end
	
end

function M.lire_octet(haute, basse)

    i2c.start(id)
    i2c.address(id, device, i2c.TRANSMITTER)
    i2c.write(id, haute)
    i2c.write(id, basse)
    i2c.stop(id)
	i2c.start(id)
    i2c.address(id, device, i2c.RECEIVER)
    c=i2c.read(id, 1)
    i2c.stop(id)
    return c

end

function M.ecrire_octet(haute, basse, valeur)

	i2c.start(id)
    i2c.address(id, device, i2c.TRANSMITTER)
    i2c.write(id, haute)
    i2c.write(id, basse)
    i2c.write(id, valeur)
    i2c.stop(id)
	tmr.delay(750)
	
end

function M.ecrire_sequence(haute, basse, valeur)

	fin_bas = bit.band(string.len(valeur),0xff)
	fin_haut =bit.rshift(string.len(valeur),8)
	i2c.start(id)
    i2c.address(id, device, i2c.TRANSMITTER)
    i2c.write(id, haute)
    i2c.write(id, basse)
	i2c.write(id, valeur)
	i2c.stop(id)
	tmr.delay(750)
	
end

function M.lire_sequence(haute, basse, longueur)

	i2c.start(id)
    i2c.address(id, device, i2c.TRANSMITTER)
   	i2c.write(id, haute)
    i2c.write(id, basse)
    i2c.stop(id)
	i2c.start(id)
    i2c.address(id, device, i2c.RECEIVER)
    c = i2c.read(id, longueur)
	print(c)
	i2c.stop(id)
    return c
	
end
