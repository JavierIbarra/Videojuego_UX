extends KinematicBody2D


func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#queue_free()
		$"/root/Main".new_load()
