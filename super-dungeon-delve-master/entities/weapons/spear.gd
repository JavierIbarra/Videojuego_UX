extends KinematicBody2D

var rot = 0


func _ready():
	rotate(rot * PI/180)
	if rot == 0 or rot == 180:
		$AnimationPlayer.play("attack", -1, 5.0)
	else:
		$AnimationPlayer.play("attack_x", -1, 5.0)
	

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
