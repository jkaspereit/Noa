extends Node

var play_services

func _ready():
	print('HELLO WORLD')
	if Engine.has_singleton("GodotPlayGamesServices"):
		play_services = Engine.get_singleton("GodotPlayGamesServices")
		var show_popups := true
		var request_email := true
		var request_profile := true
		#The client id must be created in [the google console](https://console.cloud.google.com/apis/credentials), an OAuth 2.0 Client credentials of a Web application type
		var request_token := ""
		print('HELLO WORLD2')
		play_services.init(show_popups, request_email, request_profile, request_token)
		play_services.connect("_on_sign_in_success", self, "_on_sign_in_success") # account_id: String
		play_services.connect("_on_sign_in_failed", self, "_on_sign_in_failed") # error_code: int
		print('HELLO WORLD3')

# sign into google play
func sign_in():
	if play_services:
		play_services.signIn()
		print('sign in called')

# Callbacks:
func _on_sign_in_success(userProfile_json: String) -> void:
	print('sign in success')
	var userProfile = parse_json(userProfile_json)

	# The returned JSON contains an object of userProfile info.
	# Use the following keys to access the fields
	userProfile["displayName"] # The user's display name
	userProfile["email"] # The user's email
#	userProfile["token"] # User token for backend use
	userProfile["id"] # The user's id
	print(userProfile)

func _on_sign_in_failed(error_code: int) -> void:
	print('sign in failed')
	print("Error signing in: %s" % error_code)
