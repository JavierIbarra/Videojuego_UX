extends Control

onready var player = get_node("Cinematic")

func _ready():
	player.play("Girl Room")
	yield(player, "animation_finished")
	player.play("Girl Town")
	yield(player, "animation_finished")
	player.play("Girl Dungeon")
	yield(player, "animation_finished")
	player.play("3_days")
	yield(player, "animation_finished")
	player.play("Taverna")
	yield(player, "animation_finished")
	player.play("Pueblo")
	yield(player, "animation_finished")
	player.play("knight_town")
	yield(player, "animation_finished")
	player.play("Dungeon")
	yield(player, "animation_finished")
	get_tree().change_scene("res://core/start-menu.tscn")


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://core/start-menu.tscn")
