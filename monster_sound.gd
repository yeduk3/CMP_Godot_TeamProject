extends Node2D

onready var monster = get_node("../monster_final")
var msound = false
var msound_bus = AudioServer.get_bus_index("Msound")


func _ready():
	msound = false

func _process(delta):
	if msound == true:
		AudioServer.set_bus_mute(msound_bus, true)
	else:
		AudioServer.set_bus_mute(msound_bus, false)
