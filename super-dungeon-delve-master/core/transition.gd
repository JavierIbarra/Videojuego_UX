extends CanvasLayer

onready var anim_play : AnimationPlayer = $AnimationPlayer

func change_scene_loc(path : String) -> void:
	get_tree().paused = true
	$AudioStreamPlayer.play()
	layer = 1
	anim_play.play("fade")
	yield(anim_play, "animation_finished")
	get_tree().paused = false
	get_tree().change_scene(path)
	anim_play.play_backwards("fade")
	yield(anim_play, "animation_finished")
	layer = -1
	
func change_change_level () -> void:
	get_tree().paused = true
	layer = 1
	
	anim_play.play("fade")
	yield(anim_play, "animation_finished")
	anim_play.play_backwards("fade")
	get_tree().paused = false
	yield(anim_play, "animation_finished")
	
	layer = -1
	
func _ready() -> void:
	layer = -1
	pass # Replace with function body.

