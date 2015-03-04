require("DRV8830")

DRV8830.init(3, 4, 0x68)

print("Acceleration positive et vitesse en augmentation \n")

for x = 10 ,30, 1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

print("Acceleration negative et vitesse en diminution \n")

for x = 30 ,10, -1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

print("Acceleration negative et vitesse en augmentation \n")

for x = -10 ,-30, -1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

print("Acceleration positive et vitesse en diminution \n")

for x = -30 ,-10, 1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

DRV8830.appliquer_vitesse(0)

print("Acceleration et vitesse nule \n")

print("Demonstration terminee")


DRV8830 = nil
package.loaded["DRV8830"]=nil
