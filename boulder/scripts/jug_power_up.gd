extends Button

@onready var power_bonus : int = 1
@onready var cost_jug : int = 10

@onready var CantBuySound = %CantBuySound

signal jug_bought(power)
signal apply_cost(cost)

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	if Score.score>=cost_jug:
		## Sinal to power that we are stronger
		jug_bought.emit(power_bonus)
		## Play sound
		#
		## Apply cost
		apply_cost.emit(-cost_jug)
		## Update cost
		cost_jug *= 1.1
	else:
		## Play sound 
		CantBuySound.play()
		## Show message 
		print("You don't have enough score to buy a jug !")
