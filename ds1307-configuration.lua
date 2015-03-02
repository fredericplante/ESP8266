require("ds1307")

ds1307.init(3, 4, 0x68)

seconde = 00
minute = 55
heure = 11 
jour = 5
date = 26
mois = 02
annee =15

ds1307.configurer_heure(seconde, minute, heure, jour, date, mois, annee)

ds1307 = nil
package.loaded["ds1307"]=nil
