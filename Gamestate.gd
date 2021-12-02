extends Node

var score = 0
var coins = 0

func coin_collected():
	coins += 1

func raise_score(value):
	score += value

func game_over():
	get_tree().call_group('World','enable_blur')
	get_tree().call_group('Interface','show_interface',score,coins)
	

func restart():
	Pathfinder.reset()
	get_tree().call_group('World','disable_blur')
	score = 0
	coins = 0
	get_tree().reload_current_scene()
