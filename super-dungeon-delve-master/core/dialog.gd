extends Control


var dialog ={
2:['Joe Frames: Gracias por acompañarme a buscar a mi hija. Llevo investigando estas mazmorras desde hace ya un par de días. Todo lo que sé es que alguien del pueblo la vio dirigiéndose a esta cárcel en la noche. Como si estuviera poseída. Todo lo que he podido encontrar son estas huellas.', 'Suspira…'],
5:['Joe Frames: Acabo de encontrar su zapato, acá abandonado. Ella es lo único que me queda, si algo le pasara no me lo perdonaría jamás.', 'Le tiemblan los brazos, Respira…',' Joe Frames: Contar con tu apoyo me calma, viejo amigo. Sigamos adelante!!!!'], 
7:['Joe Frames: Estas mazmorras parecen no tener fin, mientras más descendemos más monstruos aparecen. Es como si nos estuviésemos acercando a su nido, si es que eso tiene algún sentido.', '????: AaaaaaaaaaaH!!!', 'Joe Frames: Esa es mi hija!!!, juro que si alguien le puso un dedo encima, haré que lamente haber nacido.'],
11:['Joe Frames: ¡Ayúdame amigo!, tiene a mi hija atada, la quiere sacrificar para abrir este portal, ¡tenemos que hacer algo para detenerlo!']}

var dialog_index = 0
var finished = false
var text_speed = 0.01
var select = 1


func _ready():
	
	
	$RichTextLabel.bbcode_text = ''
	dialog[globals.final_boss] = ['Joe Frames: Ayudame a acabar con él!! Solo eso puede romper el hechizo que lanzo a mi hija!!']
	if globals.dead_boss:
		dialog[globals.final_boss] = ['Joe Frames: Gracias por ayudarme viejo amigo, las pitas de cerveza las invito yo']
		
	if globals.final_boss == globals.depth:
		$Label1.hide()
		$Label2.hide()
		$Sprite.hide()
		load_dialog()	
	
	
func _process(delta):
	$next.visible = finished
	get_tree().paused = true
	
	if globals.final_boss == globals.depth:
		if Input.is_action_just_pressed("ui_accept"):
			load_dialog()
	else:
		if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
			select *= -1
			
			if select == -1:
				$Sprite.position.y = $Label1.rect_position.y + $Label1.rect_size.y / 2
			if select == 1:
				$Sprite.position.y = $Label2.rect_position.y + $Label2.rect_size.y / 2
				
		if Input.is_action_just_pressed("ui_accept"):
			$Label1.hide()
			$Label2.hide()
			$Sprite.hide()
			
			if select == 1:
				load_dialog()
			
			if select == -1:
				queue_free()
				$"/root/Main".store()
	
func load_dialog():
	print (dialog_index, dialog[globals.depth].size())
	if dialog_index < dialog[globals.depth].size():
		#get_tree().paused = true
		finished = false
		$AudioStreamPlayer.play()
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
		if globals.depth == globals.final_boss:
			globals.mostrado = true
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
	$AudioStreamPlayer.stop()

func exist():
	if globals.depth in dialog or globals.depth == globals.final_boss:
		return true
	else:
		return false

func eleccion():
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
		select *= -1
		
