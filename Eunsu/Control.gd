extends Control

var vis_control = false
var master_bus = AudioServer.get_bus_index("BGM")

func _ready():
	visible = false

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == 0:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)


func _on_Bmusic_working_window(window):
	vis_control = window
	if vis_control == false:
		visible = false
	else:
		visible = true
