extends Button

@onready var power_bonus : int = 1

signal jug_bought(power)

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	## Sinal to power that we are stronger
	jug_bought.emit(power_bonus)
	## Play sound
	## probably play some sound at some point
