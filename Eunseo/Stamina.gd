extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_initialize()


func _initialize():
	var stamina_bar = $"../CooltimeBar"
	stamina_bar.max_value = 100
	stamina_bar.min_value = 0
	stamina_bar.value = 100
