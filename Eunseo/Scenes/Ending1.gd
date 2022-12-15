extends Node2D

onready var gunTimer = get_node("GunTimer")
onready var cureTimer = get_node("CureTimer")

var fade_tweeen
var Text_tween
var Text2_tween
var timeout = false

var onGun = false
var onCure = false

var TimeText = 5
var Time2Text = 5

func _ready():
	$Dialog.isEnding1()



func _on_DialogBox_hide_Dialog():
	$Picture.visible = false
	
	fade_tweeen = create_tween()
	var fade_node = get_node("Fade")
	fade_tweeen.tween_property(fade_node, "color", Color(0, 0, 0, 0), 1.5)
	
	$Dialog.use_MeetMonsterDialog()
	

onready var CureText_node = get_node("CureText")
onready var GunText_node = get_node("GunText")

func _on_DialogBox_hide_Dialog2():
	#show gunText
	Text_tween = create_tween()
	Text_tween.tween_method(self, "custom_font_override", Color(0, 0, 0, 0), Color(1, 1, 1, 1), 1.0)
	
	yield(get_tree().create_timer(1.0),"timeout")
	$Time.visible = true
	onGun = true
	gunTimer.start()
	
func custom_font_override(color):
	GunText_node.add_color_override("font_color", color)



func custom_font_override2(color):
	CureText_node.add_color_override("font_color", color)
	
func show_cureText():
	# show CureText
	Text2_tween = create_tween()
	Text2_tween.tween_method(self, "custom_font_override2", Color(0, 0, 0, 0), Color(1, 1, 1, 1), 0.5)

	#CureText timer
	yield(get_tree().create_timer(0.5),"timeout")
	print(Time2Text)
	print("time:"+str(TimeText))
	$Time.set_text(str(Time2Text))
	onCure = true
	cureTimer.start()
	$Time.visible = true
	
func _process(delta):
	# on GunTime
	if onGun == true:
		$Time.set_text(str(TimeText))
		
	# choose shoot
	if Input.is_action_pressed("shoot") && onGun == true:
		fade_tweeen = create_tween()
		var fade_node = get_node("Fade")
		fade_tweeen.tween_property(fade_node, "color", Color(0, 0, 0, 1), 1.5)
		
		$Background2.visible = true
		
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().change_scene("res://Eunseo/Scenes/Ending2Normal.tscn")
		
	
	if TimeText == 0:
		var mcfound = false
		onGun = false
		# does have cure?
		for item in PlayerItem.items:
			if item and item.info["Name"] == "Monsterizing Cure":
				mcfound = true
				# hide GunText
				#$GunText.visible = false
				Text_tween = create_tween()
				Text_tween.tween_method(self, "custom_font_override", Color(1, 1, 1, 1), Color(0, 0, 0, 0), 1.0)
				$Time.visible = false
		
				# wait for hiding
				yield(get_tree().create_timer(1.0),"timeout")
		
				show_cureText()
		# not found
		if not mcfound:
			get_tree().change_scene("res://Eunseo/Scenes/Ending2Bad.tscn")
	
	# on cureTime
	if onCure == true:
		$Time.set_text(str(Time2Text))
		
	if Time2Text == 0:
		onCure = false
		get_tree().change_scene("res://Eunseo/Scenes/Ending2Bad.tscn")
	
	if Input.is_action_pressed("left_click") && onCure == true:
		get_tree().change_scene("res://Eunseo/Scenes/Ending2Happy.tscn")


func _on_GunTimer_timeout():
	TimeText -= 1
	$Time.set_text(str(TimeText))
	gunTimer.start()



func _on_CureTimer_timeout():
	print("-1")
	Time2Text -= 1
	print(Time2Text)
	cureTimer.start()
