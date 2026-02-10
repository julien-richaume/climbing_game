extends Label

@onready var HonnoldTimer = %HonnoldTimer

func _ready():
	# Connect clicking signal to local function
	var Clicker = get_node("../ClickerBase")
	Clicker.update_label.connect(on_label_update)
	
	# Connect coach hirring signal to local function
	var Honnold = get_node("../CoachHonnold")
	Honnold.honnold_hired.connect(on_coach_hired)
	# Connect apply cost signal to local function
	Honnold.apply_cost.connect(on_label_update)
	
	var JugPowerUp = get_node("../JugPowerUp")
	JugPowerUp.apply_cost.connect(on_label_update)

#generic function to update score
func update_score():
	print_debug("updating_score")
	text = "Score: " + str(Score.score)

func on_coach_hired(mult):
	# when coach hired, auto increases
	Score.auto += mult
	HonnoldTimer.wait_time = 1.0/Score.auto
	HonnoldTimer.start()

func on_honnold_timer_timeout():
	Score.score += 1
	update_score()

func on_label_update(added_score):
	# score update for the clicker
	print("on_label_update, added_score : ", added_score)
	Score.score += added_score
	update_score()
