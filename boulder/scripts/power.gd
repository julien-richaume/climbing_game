extends Label

var power : int = 1

signal power_update(new_power)

func _ready(): 
	var Jug = get_node("../JugPowerUp")
	Jug.jug_bought.connect(on_power_update)
	
func on_power_update(added_power):
	power += added_power
	text = "Power : " + str(power)
	power_update.emit(power)
