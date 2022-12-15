extends Node2D

var sprite_tween
var bright_tween
var ending_tween

var afterStart = false

func _ready():
	yield(get_tree().create_timer(1.0),"timeout")
	
	# Moster apporaching
	sprite_tween = create_tween()
	var sprite_node = get_node("Monster")
	sprite_tween.tween_property(sprite_node, "global_position:x", global_position.x + 610, 0.5)
	
	yield(get_tree().create_timer(0.5),"timeout")
	
	# bright on
	bright_tween = create_tween()
	var bright_node = get_node("Brightness")
	bright_tween.tween_property(bright_node, "color", Color(1, 1, 1, 1), 2)
	
	#After scene
	bright_tween.tween_callback($After, "set_visible", [true])
	# bright off
	bright_tween.tween_property(bright_node, "color", Color(0, 0, 0, 0), 2).set_delay(3)
	
	yield(get_tree().create_timer(7),"timeout")
	afterStart = true
	
	if afterStart == true:
		print("dialog")
		$Dialog.use_Happy()
		

func _on_DialogBox_hide_Dialog():
	sprite_tween = create_tween()
	var sprite_node1 = get_node("After/AfterPlayer")
	var sprite_node2 = get_node("After/AfterGirl")
	sprite_tween.tween_property(sprite_node1, "global_position:y", sprite_node1.global_position.y - 250, 1)
	sprite_tween.parallel()
	sprite_tween.tween_property(sprite_node2, "global_position:y", sprite_node2.global_position.y - 250, 1)
	
	yield(get_tree().create_timer(1),"timeout")
	
	ending_tween = create_tween()
	var ending_node = get_node("EndingBackground")
	ending_tween.tween_property(ending_node, "color", Color(1, 1, 1, 1), 2)
	
	yield(get_tree().create_timer(3),"timeout")
	$EndingBackground/EndingText.visible = true

	yield(get_tree().create_timer(5),"timeout")
	get_tree().change_scene("res://Eunseo/Scenes/Menu.tscn")
