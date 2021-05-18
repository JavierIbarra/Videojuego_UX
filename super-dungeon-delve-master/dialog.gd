extends Control


var dialog ={2:['Hola soy Joe Framesl el tabernero del pueblo'], 5:['Hola soy Joe Framesl el tabernero del pueblo N2'], 7:['Hola soy Joe Framesl el tabernero del pueblo N3']}

var dialog_index = 0
var finished = false
var text_speed = 0.04


func _ready():
	$RichTextLabel.bbcode_text = ''
	load_dialog()
	
func _process(delta):
	$next.visible = finished
	if Input.is_action_just_pressed("ui_focus_next"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog[globals.depth].size():
		get_tree().paused = true
		finished = false
		$RichTextLabel.bbcode_text = dialog[globals.depth][dialog_index]
		$RichTextLabel.percent_visible = 0
		var tween_duration = text_speed * dialog[globals.depth][dialog_index].length()
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, tween_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
		get_tree().paused = false
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
