extends Button
 
@onready var scorelabel: Label = %UI/Score
@onready var SoundPlayer = %SoundPlayer
@onready var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update_score() -> void:
	score += 1

func update_label() -> void:
	scorelabel.text = "Score : "+ str(score)

func play_clicking_sound() -> void:
	SoundPlayer.play()

func _on_pressed() -> void:
	## Update score
	update_score()
	## Update score label
	update_label()
	## Play sound
	play_clicking_sound()
