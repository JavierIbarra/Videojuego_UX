extends Control

const OPT_WEAPONS = 1
const OPT_LABEL = 2

const OPT_BACK = 1
const OPT_SELECT = 2

var _selected = 1
var _old_selected = 2
var _old = 0

var _level_selected = 1
var _old_level_selected = 2
var _old_level = 0

var weapon = globals.n_weapons
var weapons = {1: "hammer", 2: "sword", 3: "spear"}

func _ready():
	$ColorRect.visible = true
	$GoldLabel.text = str(globals.gold) 
	
func _process(delta):
	$Sprite1.hide()
	$Sprite2.hide()
	$Sprite3.hide()
	get_node("Sprite"+ str(weapon)).visible = true
		
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
		_old_level = _level_selected
		_level_selected = _old_level_selected
		_old_level_selected = _old_level
		
	if _level_selected == OPT_WEAPONS:
		$ColorRect.visible = true
		$AnimationPlayer.stop()
		$AnimationPlayer2.stop()
		$Label1.modulate = Color.white
		$Label2.modulate = Color.white
		
		if Input.is_action_just_pressed("ui_right"):
			weapon += 1
			if weapon > 3:
				weapon = 1
		
		if Input.is_action_just_pressed("ui_left"):
			weapon -= 1
			if weapon < 1:
				weapon = 3
		
		
		
			
	if _level_selected == OPT_LABEL:
		#$AnimationPlayer.play("selected")
		$ColorRect.visible = false
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			_old = _selected
			_selected = _old_selected
			_old_selected =  _old
				
		if _selected == OPT_BACK:
			$AnimationPlayer2.stop()
			$Label2.modulate = Color.white
			$AnimationPlayer.play("selected")
					
		if _selected == OPT_SELECT:
			$AnimationPlayer.stop()
			$Label1.modulate = Color.white
			$AnimationPlayer2.play("selected")
			
			if Input.is_action_just_pressed("ui_accept"):
				globals.weapons = weapons[weapon] 
				globals.n_weapons = weapon
				queue_free()
			
