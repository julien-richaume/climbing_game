extends Label

var score : int = 0

func _ready():
	# Connect signal to local function
	var Clicker = get_node("../ClickerBase")
	Clicker.update_label.connect(on_label_update)

func on_label_update(new_score):
	text = "Score: " + str(new_score)
