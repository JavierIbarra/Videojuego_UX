extends KinematicBody2D

var mostrar = true
var primera = true

func _ready():
	if globals.final_boss == globals.depth:
		$AnimatedSprite.play("hija 1")
	else:
		$AnimatedSprite.play("static")
		
func _physics_process(delta):
	if globals.mostrado:
		$AnimatedSprite.hide()
		
	if globals.final_boss == globals.depth:
		if get_tree().get_nodes_in_group("monsters") == []:
			$AnimatedSprite.show()
			$AnimatedSprite.play("hija 2")
			globals.dead_boss = true
			if mostrar:
				$"/root/Main".new_load()
				mostrar = false
				
				
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if globals.final_boss == globals.depth:
			if primera:
				$"/root/Main".new_load()
				primera = false
				
		else:
			$"/root/Main".new_load()
			
