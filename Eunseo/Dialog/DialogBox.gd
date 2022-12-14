extends ColorRect

signal hide_Dialog

onready var dialogPath = "res://Eunseo/Dialog/json/PrologDialog.json"
export(float) var textSpeed = 0.05

var dialog
export var isProlog = false
var hide = false

var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
	
func _process(delta):
	$Next.visible = finished
	if Input.is_action_just_released("space"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
	if isProlog == true && hide == true:
		get_tree().change_scene("res://Main/Main1F.tscn")
	
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
	if phraseNum >= len(dialog):
		hide = true
		emit_signal("hide_Dialog")
		visible = false
		print("Hide Dialog")
		return
		
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
	print("Out")
	finished = true
	phraseNum += 1
	return

func set_dialog(var path):
	dialogPath = path
	dialog = getDialog()
	hide = false
	visible = true
	phraseNum = 0
	nextPhrase()
