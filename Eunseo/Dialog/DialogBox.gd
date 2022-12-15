extends ColorRect

signal hide_Dialog
signal hide_Dialog2
signal hide_Dialog3

onready var dialogPath = " "
export(float) var textSpeed = 0.05

var dialog
export var isProlog = false
var already_gone = false
var hide = false
var DialogNum = 0

var phraseNum = 0
var finished = false

var timeout = false

var active_dialog = false

func _ready():
	$Timer.wait_time = textSpeed
	#dialog = getDialog()
	#assert(dialog, "Dialog not found")
	#nextPhrase()
	
func _process(delta):
	$Next.visible = finished
	if active_dialog and Input.is_action_just_released("space"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
	#if isProlog == true && hide == true:
	#	get_tree().change_scene("res://Main/Main1F.tscn")
	
func getDialog() -> Array:
	var f = File.new()
	print(dialogPath)
	assert(f.file_exists(dialogPath), "File path does not exist")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		
func nextPhrase() -> void:
	print(str("Cur Phrase Num: ", phraseNum))
	if phraseNum >= len(dialog):
		print("End dialog")
		hide = true
		visible = false
		active_dialog = false
		if DialogNum == 0:
			# 1. dialog가 끝나면 여기서 hide_Dialog라는 신호를 보냅니다
			emit_signal("hide_Dialog")
			DialogNum += 1
			finished = false
		elif DialogNum == 1:
			emit_signal("hide_Dialog2")
			DialogNum+= 1
		elif DialogNum == 2:
			emit_signal("hide_Dialog3")
		return
	finished = false
	#print(DialogNum)
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	phraseNum += 1
	return

func set_dialog(var path):
	dialogPath = path
	dialog = getDialog()
	hide = false
	visible = true
	phraseNum = 0
	print(str("Dialog length: ",len(dialog)))
	nextPhrase()
	active_dialog = true
