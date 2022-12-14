extends Node2D

onready var timer = get_node("Timer")

var fade_tweeen
var Text_tween
var timeout = false

var TimeText = 10

func _ready():
	$Dialog.isEnding1()



func _on_DialogBox_hide_Dialog():
	$Picture.visible = false
	
	fade_tweeen = create_tween()
	var fade_node = get_node("Fade")
	fade_tweeen.tween_property(fade_node, "color", Color(0, 0, 0, 0), 1.5)
	
	$Dialog.use_MeetMonsterDialog()
	


onready var GunText_node = get_node("GunText")

func _on_DialogBox_hide_Dialog2():
	Text_tween = create_tween()
	Text_tween.tween_method(self, "custom_font_override", Color(0, 0, 0, 0), Color(1, 1, 1, 1), 1.0)
	
	yield(get_tree().create_timer(1.0),"timeout")
	$Time.visible = true
	timer.start()
	
func custom_font_override(color):
	GunText_node.add_color_override("font_color", color)
	
	
func _process(delta):
	if Input.is_action_pressed("shoot"):
		fade_tweeen = create_tween()
		var fade_node = get_node("Fade")
		fade_tweeen.tween_property(fade_node, "color", Color(0, 0, 0, 1), 1.5)
		
		$Background2.visible = true
		
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().change_scene("res://Eunseo/Scenes/Ending2Normal.tscn")
		
	$Time.set_text(str(TimeText))
	
	if TimeText == 0:
		for item in PlayerItem.items:
			if item.info["Name"] == "Monsterizing Cure":
				get_tree().change_scene("res://Eunseo/Scenes/Ending2Happy.tscn")
		# not found
		get_tree().change_scene("res://Eunseo/Scenes/Ending2Bad.tscn")


func _on_Timer_timeout():
	TimeText -= 1
	timer.start()
