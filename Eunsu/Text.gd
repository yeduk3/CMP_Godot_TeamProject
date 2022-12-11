extends RichTextLabel

#var dialog = ["Hi, I am Banana.", "Nice to meet you!", "Goodbye~"]
var dialog
var page = 0

func _ready():
	dialog = get_parent().dialog
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("space"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				emit_signal("hide")
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
