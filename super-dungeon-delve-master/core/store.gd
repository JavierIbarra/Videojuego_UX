extends Control

var weapon = 1

var largo = 0
var old_weapon = 0

# globals.weapòns = {1 : [nombre, precio, activo]}

func _ready():
	get_tree().paused = true
	$ProgressBar.value = globals.player.health
	largo = len(globals.weapons)
	$GoldLabel.text = str(globals.gold)
	for numero in range(1,largo+1):
		get_node("Weapon"+str(numero)+"/valor"+str(numero)).text = str(globals.weapons[numero][1])
		if globals.weapons[numero][2] == false:
			get_node("Weapon"+str(numero)+"/Sprite"+str(numero)).modulate = Color("3c3c3c")
	
func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()
		get_tree().paused = false
		$"/root/Main/HUD/HealthBar".value = globals.player.health
		$"/root/Main/HUD/GoldLabel".text = str(globals.gold)
	
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
		pass
		
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_down"):
		old_weapon = weapon
		weapon -= 1
		if weapon < 1:
			weapon = largo+1
		get_node("Weapon"+str(old_weapon)).color = Color("25131a")
		get_node("Weapon"+str(weapon)).color = Color("f85d00")
		
		pass
		
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_up"):
		old_weapon = weapon
		weapon += 1
		if weapon > largo+1:
			weapon = 1
		get_node("Weapon"+str(old_weapon)).color = Color("25131a")
		get_node("Weapon"+str(weapon)).color = Color("f85d00")
		
	if Input.is_action_just_pressed("ui_accept"):
		if weapon > 0 and weapon <= largo:
			comprar(weapon)
		else:
			heal(100-globals.player.health)
		
func comprar(weapon):
	if globals.gold >= globals.weapons[weapon][1]:
		globals.gold -= globals.weapons[weapon][1]
		globals.weapons[weapon][1] = 0
		$GoldLabel.text = str(globals.gold)
		get_node("Weapon"+str(weapon)+"/valor"+str(weapon)).text = str(globals.weapons[weapon][1])
		get_node("Weapon"+str(weapon)+"/Sprite"+str(weapon)).modulate = Color("ffffff")
		globals.weapons[weapon][2] = true
		
	else:
		# faltan monedas (implentar sonido y un color rojo que señale la que faltan monedas
		$AnimationPlayer.play("golden")

func heal(ammount: int):
	if globals.gold >= 1000 and globals.player.health < 100:
		globals.gold -= 1000
		globals.player.health = min(globals.player.health + ammount, 100)
		if globals.player.health > 20:
			$"/root/Main/CanvasModulate".set_color(Color(0.57,0.57,0.57))
			
		$ProgressBar.value = globals.player.health	
		$ProgressBar.theme
		$GoldLabel.text = str(globals.gold)
		
		#$"/root/Main/HUD/HealthBar/AnimationPlayer".play("blink")
	else:
		$AnimationPlayer.play("golden")
	
