extends Node2D

onready var timer = get_node("Timer")
var timeout = false

var sprite_tween
var fade_tween

func _ready():
	$Dialog.use_Normal1()
	timer.set_wait_time(2)
	
func _process(delta):
	if timeout == true:
		$Dialog.use_Normal2()
		timeout = false

func _on_Timer_timeout():
	timeout = true
	timer.stop()


func _on_DialogBox_hide_Dialog():
	timer.start()
	sprite_tween = create_tween()
	var sprite_node = get_node("Player")
	sprite_tween.tween_property(sprite_node, "global_position:x", global_position.x + 440, 2)


func _on_DialogBox_hide_Dialog2():
	print("s")
	$Picture.visible = true
	yield(get_tree().create_timer(2.0),"timeout")
	$Picture.visible = false
	
	$Monster.visible = false
	$Girl.visible = true
	
	$Dialog.use_Normal3()


func _on_DialogBox_hide_Dialog3():
	
	fade_tween = create_tween()
	var fade_node = get_node("Fade")
	fade_tween.tween_property(fade_node, "color", Color(0, 0, 0, 1), 1.5)
	
	get_tree().change_scene("res://Main/MainB1F.tscn")
