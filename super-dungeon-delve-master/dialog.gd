extends Control


var dialog ={
2:['Joe Frames: Gracias por acompañarme a buscar a mi hija. Llevo investigando estas mazmorras desde hace ya un par de días. Todo lo que sé es que alguien del pueblo la vio dirigiéndose a esta cárcel en la noche. Como si estuviera poseída. Todo lo que he podido encontrar son estas huellas.', 'Suspira…'],
5:['Joe Frames: Acabo de encontrar su zapato, acá abandonado. Ella es lo único que me queda, si algo le pasara no me lo perdonaría jamás.', 'Le tiemblan los brazos, Respira…',' Joe Frames: Contar con tu apoyo me calma, viejo amigo. Sigamos adelante!!!!'], 
7:['Joe Frames: Estas mazmorras parecen no tener fin, mientras más descendemos más monstruos aparecen. Es como si nos estuviésemos acercando a su nido, si es que eso tiene algún sentido.', '????: AaaaaaaaaaaH!!!', 'Joe Frames: Esa es mi hija!!!, juro que si alguien le puso un dedo encima, haré que lamente haber nacido.'],
11:['Joe Frames: ¡Ayúdame amigo!, tiene a mi hija atada, la quiere sacrificar para abrir este portal, ¡tenemos que hacer algo para detenerlo!']}

var dialog_index = 0
var finished = false
var text_speed = 0.01


func _ready():
	$RichTextLabel.bbcode_text = ''
	load_dialog()
	
func _process(delta):
	$next.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
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

func exist():
	if globals.depth in dialog:
		return true
	else:
		return false
