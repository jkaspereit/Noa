extends Control

signal regestration_successful;

onready var HTTP = $HTTPRequest;
onready var Username: LineEdit = $Username
onready var Email: LineEdit = $Email
onready var Password: LineEdit = $Password

func _on_RegisterButton_button_down():
	Firebase.register(Username.text,Email.text,Password.text,HTTP)

func _on_Username_text_changed(new_text):
	$RegisterButton.disabled = is_Registration_disabled();

func _on_Email_text_changed(new_text):
	$RegisterButton.disabled = is_Registration_disabled();

func _on_Password_text_entered(new_text):
	$RegisterButton.disabled = is_Registration_disabled();

func is_Registration_disabled():
	return Email.text.empty() or Username.text.empty() or Password.text.empty();

func _on_Registration_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		print('Error by registration: %s' % response_body.result.error.message)
	else:
		emit_signal("regestration_successful")
