extends Control

const OPT_DIFFICULTY = 0
const OPT_STATISTIC = 2
const OPT_BACK = 2

var _selected = 0
var _old_selected = 1

var difficulty = {5: "Easy", 10:"Normal", 15:"Hard"}

func _ready():
	$Label0.text = "Difficulty: " + difficulty[globals.difficulty]
	$AnimationPlayer.play("selected")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if _selected == OPT_STATISTIC:
			pass
			
		if _selected == OPT_BACK:
			get_tree().change_scene("res://core/start-menu.tscn")
			
	if Input.is_action_just_pressed("ui_down"):
		_old_selected = _selected
		_selected += 1
		if _selected > 2:
			_selected = 0
			
	if Input.is_action_just_pressed("ui_up"):
		_old_selected = _selected
		_selected -= 1
		if _selected < 0:
			_selected = 2
			
	if _selected == OPT_DIFFICULTY:
		if Input.is_action_just_pressed("move_right"):
			globals.difficulty += 5 
			if globals.difficulty > 15:
				globals.difficulty = 5 
			$Label0.text = "Difficulty: " + difficulty[globals.difficulty]
			
		if Input.is_action_just_pressed("move_left"):
			globals.difficulty -= 5
			if globals.difficulty < 5:
				globals.difficulty = 15 
			$Label0.text = "Difficulty: " + difficulty[globals.difficulty]
			
			
	# Move pointer next to selected option label
	$pointer.position.y = get_node("Label"+str(_selected)).rect_position.y + get_node("Label"+str(_selected)).rect_size.y / 2
	
	# Change the animation which makes the labels "glow"
	var ani = $AnimationPlayer.get_animation("selected")
	get_node("Label"+str(_old_selected)).modulate = Color.white
	# We can modify the property the animation path animates on the fly, how clever!
	ani.track_set_path(1, "Label"+str(_selected)+":modulate")				
