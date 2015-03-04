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

function M.lire_erreur()

    tampon = 0;
	reprendre = 0x80;
	
	i2c.start(id)
    i2c.address(id, 0x68, i2c.TRANSMITTER)
    i2c.write(id, 0x01)
    i2c.stop(id)
	i2c.start(id)
    i2c.address(id, 0x68, i2c.RECEIVER)
    tampon=i2c.read(id, 1)
    i2c.stop(id)
	
	
	i2c.start(id)
	i2c.address(id, 0x68 , i2c.TRANSMITTER)
	i2c.write(id, 0x01, reprendre)
	i2c.stop(id)
	
	return string.byte(tampon)
	
end

function M.appliquer_vitesse(vitesse)

	if vitesse < 0 then 
	
		direction = 0x01
		vitesse = vitesse * -1
		
	elseif  vitesse > 0 then
		
		direction = 0x02
		
	end
	
	i2c.start(id)
	i2c.address(id, 0x68 , i2c.TRANSMITTER)
	vitesse = bit.lshift(vitesse,2)
	vitesse = bit.bor(vitesse, direction)
	i2c.write(id, 0x00, vitesse)
	i2c.stop(id)
	
end


