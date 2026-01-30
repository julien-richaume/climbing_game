extends Button

@onready var auto_click : int = 1

signal honnold_hired(power)

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	## Sinal to power that we are stronger
	honnold_hired.emit(auto_click)
	## Play sound
	## probably play some sound at some point
