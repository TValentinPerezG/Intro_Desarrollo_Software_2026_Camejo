# Usuarios y Contraseñas
# cool_cat123,BananaSplit99
# xXx_panda_xXx,unicornu
# spacetraveler42,42isTheAnswer!
# flower_power,RedRoses
# shadow_ninja,!ninjaWarrior22
# _bubblegumqueen,candyLand2024
# the_real_hero,p@ssw0rd!
# pirateKing777,G0ld&Silver$$?
# coffee_addict,latteLover123
# bookworm89,openSesame!
# pepeMaquina,Ave7#0

# Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos 
# usuarios en una plataforma. La estructura es nombre_usuario,contraseña. 
# Se pide extraer, del archivo:

# 15 Las contraseñas que comienzen y terminen con el mismo caracter.

grep -Eio ",(\S).*\1$" contraseñas.csv | sed 's/,//'
