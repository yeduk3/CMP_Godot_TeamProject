extends Node2D

var fade_tweeen

func _ready():
	$Dialog.isEnding1()



func _on_DialogBox_hide_Dialog():
	$Picture.visible = false
	
	fade_tweeen = create_tween()
	var fade_node = get_node("Fade")
	fade_tweeen.tween_property(fade_node, "color", Color(0, 0, 0, 0), 1.0)
	
	$Dialog.use_MeetMonsterDialog()
	
