extends Control

onready var http = $HTTPRequest

func to_leaderboard():
	visible = true

func to_home():
	visible = false

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	pass # Replace with function body.


func _on_Return_pressed():
	get_tree().call_group('Interface','to_home')
