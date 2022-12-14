extends Node2D

var stat = StatManager

func check():
	if stat._get_stat2() >= 60:
		return 
	
	
