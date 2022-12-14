extends Node2D

var sprite_tween

func _ready():
	yield(get_tree().create_timer(1.0),"timeout")
	
	sprite_tween = create_tween()
	var sprite_node = get_node("Monster")
	sprite_tween.tween_property(sprite_node, "global_position:x", global_position.x + 610, 0.5)
