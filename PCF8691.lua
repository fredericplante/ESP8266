local id = 0
local Nom_du_module = ...
local M = {}
_G[Nom_du_module] = M

function M.init(d, l, a)

	sda = d
	scl = l
	device = a
	if (i2c.setup(id, sda, scl, i2c.SLOW)) ~= 0 then print("La configuration du port I2C s'est fait correctement'")
	elseif (i2c.setup(id, sda, scl, i2c.SLOW)) == 0 then  print("Erreur dans la configuration du port I2C!") return nil
	end

end

function M.lire_registre(adresse)

	i2c.start(id)
    i2c.address(id, device ,i2c.TRANSMITTER)
    i2c.write(id, adresse)
    i2c.stop(id)
    i2c.start(id)
    i2c.address(id, device, i2c.RECEIVER)
    c=i2c.read(id, 4)
    i2c.stop(id)
    return c

end

function M.ecrire_registre(adresse, valeur)

	i2c.start(id)
    i2c.address(id, device, i2c.TRANSMITTER)
    i2c.write(id, adresse)
    i2c.write(id, valeur)
    i2c.stop(id)
	
end

