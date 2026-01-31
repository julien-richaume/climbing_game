extends Label

var score : int = 0
var auto : int = 0

@onready var HonnoldTimer = %HonnoldTimer

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
	HonnoldTimer.wait_time = 1.0/auto
	HonnoldTimer.start()

func on_honnold_timer_timeout():
	score += 1
	update_score()

func on_label_update(added_score):
	# score update for the clicker
	score += added_score
	update_score()
