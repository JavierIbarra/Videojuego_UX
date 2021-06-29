extends Control

var select_weapon = globals.n_weapons
var select_option = 1
var level = -1

func _ready():
	$ColorRect.visible = true
	$GoldLabel.text = str(globals.gold) 
	
func _process(delta):
	if Input.is_action_just_pressed("back"):
		queue_free()
	
	for i in globals.weapons:
		get_node("Sprite"+ str(i)).visible = false
		
	get_node("Sprite"+ str(select_weapon)).visible = true
	
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
		level *= -1
		
	if level == 1: # opciones
		$ColorRect.visible = false
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			select_option *= -1
			
		if select_option == -1: # Salir
			$AnimationPlayer2.stop()
			$Label2.modulate = Color.white
			$AnimationPlayer.play("selected")
			
			if Input.is_action_just_pressed("ui_accept"):
				queue_free()
					
		if select_option == 1: # Confirmar
			$AnimationPlayer.stop()
			$Label1.modulate = Color.white
			$AnimationPlayer2.play("selected")
			
			if Input.is_action_just_pressed("ui_accept"):
				globals.n_weapons = select_weapon
				queue_free()

	if level == -1: # armas
		$ColorRect.visible = true
		$AnimationPlayer.stop()
		$AnimationPlayer2.stop()
		$Label1.modulate = Color.white
		$Label2.modulate = Color.white
		
		if Input.is_action_just_pressed("ui_right"):
			while true:
				select_weapon += 1
				if select_weapon > len(globals.weapons):
					select_weapon = 1
				if globals.weapons[select_weapon][2]:
					break
		
		if Input.is_action_just_pressed("ui_left"):
			print (len(globals.weapons))
			while true:
				select_weapon -= 1
				if select_weapon < 1:
					select_weapon = len(globals.weapons)
				if globals.weapons[select_weapon][2]:
					break
		
		
	
