extends Control

var from = 'login'

func _on_BackButton_pressed():
	visible = false
	match from:
		'login': get_tree().call_group('Auth','to_login')
		'register': get_tree().call_group('Auth','to_register') 

func to_error(from: String,error_msg: String):
	print('im here')
	self.from = from;
	$ErrorMessage.text = error_msg
	visible = true;
