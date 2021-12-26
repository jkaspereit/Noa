extends Node

var score = 0
var coins = 0

var game_running = false;

func coin_collected():
	coins += 1

func raise_score(value):
	score += value

func start_game():
#	get_tree().call_group('Camera','focus_char')
	game_running = true;

func game_over():
	game_running = false;
	get_tree().call_group('World','enable_blur')
	get_tree().call_group('Interface','show_DeadScreen',score,coins)

func restart():
	Generator.generate()
	get_tree().call_group('Character','reset')
	get_tree().call_group('World','disable_blur')
	score = 0
	coins = 0
