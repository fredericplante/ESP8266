require("DRV8830")

DRV8830.init(3, 4, 0x68)

for x = 10 ,30, 1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

for x = 30 ,10, -1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

for x = -10 ,-30, -1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

for x = -30 ,-10, 1 do

DRV8830.appliquer_vitesse(x)
tmr.delay(1000000)

end

DRV8830.appliquer_vitesse(0)

DRV8830 = nil
package.loaded["DRV8830"]=nil
