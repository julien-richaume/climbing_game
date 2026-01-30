extends Button
 
#@onready var scorelabel: Label = %UI/Score
@onready var SoundPlayer = %ClickingSound

#@onready var score : int = 0
@onready var power : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var power_listener = get_node("../Power")
	power_listener.power_update.connect(on_update_power)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#func update_score(p: int) -> void:
#	score += p

signal update_label(added_score)

func play_clicking_sound() -> void:
	SoundPlayer.play()

func on_update_power(new_power): 
	power = new_power
	
func _on_pressed() -> void:
	## Update score
	# update_score(power)
	## Update score and label 
	update_label.emit(power)
	## Play sound
	play_clicking_sound()
