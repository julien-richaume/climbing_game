extends Button

@onready var auto_click_power : int = 1
@onready var cost_honnold : int = 50

@onready var HonnoldTimer = %HonnoldTimer
@onready var CantBuySound = %CantBuySound

signal honnold_hired(power)
signal apply_cost(cost)

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	print(cost_honnold, "score:", Score.score)
	if Score.score>=cost_honnold:
		## Sinal to power that we are stronger
		honnold_hired.emit(auto_click_power)
		## Play sound
		#
		## Apply cost
		apply_cost.emit(-cost_honnold)
		## Update cost
		cost_honnold *= 1.1
	else:
		## Play sound 
		CantBuySound.play()
		## Show message 
		print("You don't have enough score to hire coach honnold !")
