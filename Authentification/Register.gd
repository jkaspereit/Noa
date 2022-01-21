extends Control

onready var HTTP = $HTTPRequest;
onready var Username: LineEdit = $Username
onready var Email: LineEdit = $Email
onready var Password: LineEdit = $Password

func to_register():
	visible = true

func _on_RegisterButton_button_down():
	Firebase.register(Username.text,Email.text,Password.text,HTTP)

func is_Registration_disabled():
	return Email.text.empty() or Username.text.empty() or Password.text.empty();

func _on_Registration_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		visible = false
		get_tree().call_group('Auth','to_error','register',response_body.result.error.message)
	else:
		get_tree().call_group('Auth','login',Email.text,Password.text)

func _input(event):
	$RegisterButton.disabled = is_Registration_disabled();

func _on_BackButton_pressed():
	visible = false;
	get_tree().call_group('Auth', 'to_login')
