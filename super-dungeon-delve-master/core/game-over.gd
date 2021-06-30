extends Control

func _ready():
	$ScoresLabel.text = "Depth:  " + str(globals.depth * 100) + "ft\nGold:  " + str(globals.gold) + "\nKills:  " + str(globals.kills)
	#reiniciar_globales()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://core/start-menu.tscn")
		
func reiniciar_globales():
	globals.gold = 0
	globals.depth = 1
	globals.kills = 0
	globals.weapons = {1: ["hammer", 0, true], 2: ["sword", 5000, false], 3: ["spear", 7000, false]}
	globals.n_weapons = 1
	globals.dead_boss = false
	globals.mostrado = false
