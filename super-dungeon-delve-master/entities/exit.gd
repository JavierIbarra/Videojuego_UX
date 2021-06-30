extends Node2D

var dead_boss = false

func _ready():
	if globals.final_boss == globals.depth:
		$Sprite.hide()
		
func _physics_process(delta):
	if get_tree().get_nodes_in_group("monsters") == []:
		globals.dead_boss = true
		$Sprite.show()
		
func _on_Area2D_body_entered(body):
	if globals.final_boss == globals.depth:
		if globals.dead_boss:
			if body.name == "Player":
				queue_free()
				$"/root/Main".next_level()
			
	if globals.final_boss != globals.depth:
		if body.name == "Player":
			queue_free()
			$"/root/Main".next_level()
