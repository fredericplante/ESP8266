require("ds1307")

ds1307.init(3, 4, 0x68)

seconde, minute, heure, jour, date, mois, annee = ds1307.obtenir_heure();
print(string.format("Heure: & Date: %s:%s:%s %s/%s/%s", heure, minute, seconde, date, mois, annee))

ds1307 = nil
package.loaded["ds1307"]=nil
