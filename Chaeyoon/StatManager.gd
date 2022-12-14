extends Node2D

var player_health
var player_stat1
var player_stat2
var player_stat3

func _ready():
	player_health = 100
	player_stat1 = 0
	player_stat2 = 0
	player_stat3 = 0

# getter & setter
func _get_health():
	return player_health
	
func _set_health(value):
	player_health = value
	
func _get_stat1():
	return player_stat1
	
func _set_stat1(value):
	player_stat1 = value
		
func _get_stat2():
	return player_stat2
	
func _set_stat2(value):
	player_stat2 = value
		
func _get_stat3():
	return player_stat3
	
func _set_stat3(value):
	player_stat3 = value
	
