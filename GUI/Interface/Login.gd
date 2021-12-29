extends Control

onready var http: HTTPRequest = $HTTPRequest
onready var http2: HTTPRequest = $HTTPRequest2
onready var username: LineEdit = $Username
onready var password: LineEdit = $Password

# On Button up, else Noa would jump. 
func _on_Button_button_up():
	Gamestate.start_game()
	visible = false


func _on_Register_button_down():
	if username.text.empty() or password.text.empty():
		print('invalid input')
		return
	Firebase.register(username.text,password.text,http)


func _on_Login_button_down():
	if username.text.empty() or password.text.empty():
		print('invalid input')
		return
	Firebase.login(username.text,password.text,http2)


func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		print(response_body.result.error.message)
	else:
		print('Registration successful!')


func _on_HTTPRequest2_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		print(response_body.result.error.message)
	else:
		print('Login successful!')
