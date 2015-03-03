require("AT24C32")

AT24C32.init(3, 4, 0x50)

AT24C32.ecrire_octet(0x00, 0x00, "A")
print("\nUn octet, representant la lettre A, a ete ecrit sur la memoire")
print("\nLa lettre " .. AT24C32.lire_octet(0x00, 0x00) .. " a ete lue depuis un octet de la memoire")

AT24C32 = nil
package.loaded["AT24C32"]=nil
