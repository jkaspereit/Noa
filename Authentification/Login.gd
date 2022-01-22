extends Control

onready var http: HTTPRequest = $HTTPRequest
onready var Email: LineEdit = $Email
onready var Password: LineEdit = $Password

var play_services

func _ready():
	init_play_services();
	gplay_sign_in();

func to_login():
	visible = true

func _on_Register_button_down():
	visible = false
	get_tree().call_group('Auth','to_register')

func login(email: String, password: String):
	Firebase.login(email,password,http)

func _on_Login_button_down():
	login(Email.text,Password.text)

func _on_Login_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		visible = false;
		get_tree().call_group('Auth','to_error','login',response_body.result.error.message)
	else:
		get_tree().change_scene("res://Noa.tscn")
	

func init_play_services():
	if Engine.has_singleton("GodotPlayGamesServices"):
		play_services = Engine.get_singleton("GodotPlayGamesServices")
		var show_popups := true
		var request_email := true
		var request_profile := true
		#The client id must be created in [the google console](https://console.cloud.google.com/apis/credentials), an OAuth 2.0 Client credentials of a Web application type
		var request_token := ""
		play_services.init(show_popups, request_email, request_profile, request_token)
		play_services.connect("_on_sign_in_success", self, "_on_sign_in_success") # account_id: String
		play_services.connect("_on_sign_in_failed", self, "_on_sign_in_failed") # error_code: int

# sign into google play
func gplay_sign_in():
	if play_services:
		play_services.signIn()
	else:
		print('Google Play Services not found. Manual Login required.')

# Callback sign_in() success
func _on_sign_in_success(userProfile_json: String) -> void:
	var userProfile = parse_json(userProfile_json)

	# The returned JSON contains an object of userProfile info.
	# Use the following keys to access the fields
	userProfile["displayName"] # The user's display name
	userProfile["email"] # The user's email
#	userProfile["token"] # User token for backend use
	userProfile["id"] # The user's id
	print(userProfile)
	get_tree().change_scene("res://Noa.tscn")

# Callback sign_in() failed
func _on_sign_in_failed(error_code: int) -> void:
	$ManualLogin.visible = true;
	$ManualLogin/ErrorLabel.set_text('Google Play Login failed.')
	print("Error signing in: %s" % error_code)

func _input(event):
	$LoginButton.disabled = is_login_disabled()

func is_login_disabled():
	return Email.text.empty() or Password.text.empty()
