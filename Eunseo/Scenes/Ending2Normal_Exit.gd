extends Node2D

var ending_tween

func _ready():
	"""
	#sprite_tween = create_tween()
	#var sprite_node1 = get_node("After/AfterPlayer")
	#sprite_tween.tween_property(sprite_node1, "global_position:y", sprite_node1.global_position.y - 250, 1)
	
	yield(get_tree().create_timer(1),"timeout")
	
	ending_tween = create_tween()
	var ending_node = get_node("EndingBackground")
	ending_tween.tween_property(ending_node, "color", Color(1, 1, 1, 1), 2)
	
	yield(get_tree().create_timer(3),"timeout")
	$EndingBackground/EndingText.visible = true

	yield(get_tree().create_timer(5),"timeout")
	get_tree().change_scene("res://Eunseo/Scenes/Menu.tscn")
	"""
	$StudyNotePanel/TextLabel.text = ""
	var texts = Item.get_new_item_data("Study Note 5").info["Text"]
	for text in texts:
		$StudyNotePanel/TextLabel.text += text + "\n"
	$StudyNotePanel.visible = true


func _on_StudyNotePanel_gui_input(event):
	if event.is_action_pressed("left_click"):
		$StudyNotePanel.visible = false
		EndingManager.set_studynote5()
		
		
		yield(get_tree().create_timer(2),"timeout")
		
		ending_tween = create_tween()
		var ending_node = get_node("EndingBackground")
		ending_tween.tween_property(ending_node, "color", Color(0, 0, 0, 1), 2)
		
		yield(get_tree().create_timer(3),"timeout")
		$EndingBackground/EndingText.visible = true

		yield(get_tree().create_timer(5),"timeout")
		get_tree().change_scene("res://Eunseo/Scenes/Menu.tscn")
