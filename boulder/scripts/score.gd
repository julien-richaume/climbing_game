extends Label

var score : int = 0
var auto : int = 0

func _ready():
	# Connect clicking signal to local function
	var Clicker = get_node("../ClickerBase")
	Clicker.update_label.connect(on_label_update)
	
	# Connect coach hirring signal to local function
	var Honnold = get_node("../CoachHonnold")
	Honnold.honnold_hired.connect(on_coach_hired)

#generic function to update score
func update_score():
	text = "Score: " + str(score)

func on_coach_hired(mult):
	# when coach hired, auto increases
	auto += mult

func on_honnold_timer_timeout():
	# every time the timer ends for honnold, update score
	score += auto
	update_score()


func on_label_update(added_score):
	# score update for the clicker
	score += added_score
	update_score()
