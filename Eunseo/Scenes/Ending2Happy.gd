extends Node2D

var sprite_tween
var bright_tween

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
	
	afterStart = true
	
	if afterStart == true:
		$Dialog.use_Happy()
