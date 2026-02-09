extends Button

@onready var SoundPlayer = %ClickingSound

@onready var power : int = 1

signal update_label(added_score)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var power_listener = get_node("../Power")
	power_listener.power_update.connect(on_update_power)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func play_clicking_sound() -> void:
	SoundPlayer.play()

func on_update_power(new_power): 
	print('new_power : ')
	print(new_power)
	power = new_power
	
func _on_pressed() -> void:
	## Update score and label 
	update_label.emit(power)
	## Play sound
	play_clicking_sound()
