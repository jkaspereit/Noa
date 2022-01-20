extends Control

func sort_descending(a, b):
	if a.highscore < b.highscore:
		return false
	return true

onready var highscore_array = [
	$Rang1/Highscore,
	$Rang2/Highscore,
	$Rang3/Highscore,
	$Rang4/Highscore,
	$Rang5/Highscore,
]

onready var player_array = [
	$Rang1/Player,
	$Rang2/Player,
	$Rang3/Player,
	$Rang4/Player,
	$Rang5/Player,
]

onready var httpFetchData = $FetchData
onready var httpUpdateHighscore = $UpdateHighscore

var rank = -1;
var display_data = [];

func _ready():
	# call it, or update leaderboard will fail
	fetch_data();

func to_leaderboard():
	fetch_data();
	yield(httpFetchData,"request_completed")
	display_leaderboard();
	display_player();
	visible = true;

func game_over():
	var new_score = Gamestate.calculate_score();
	# It's possible that Gamestate updates the player_highscore earlier
	# so it's necessary to update the score even if its balanced.
	if Gamestate.player_highscore <= new_score:
		update_highscore(new_score)

func update_highscore(new_score):
	var entry = {
		"highscore": {"integerValue": new_score},
		"username": {"stringValue": Firebase.user_info.username}
	}
	# couldn't find highscore in leaderboard, so a create new one.
	if rank == -1:
		Firebase.save_document("leaderboard?documentId=%s" % Firebase.user_info.id,entry,httpUpdateHighscore)
	# update highscore
	else:
		Firebase.update_document("leaderboard/%s" % Firebase.user_info.id,entry,httpUpdateHighscore)
	# we have to update the leaderboard data to avoid erros
	fetch_data();

func fetch_data():
	# we have to reset all information before fetching new ones.
	reset();
	Firebase.get_document('leaderboard',httpFetchData);

func display_leaderboard():
	for i in range(min(display_data.size(),5)):
		if display_data[i]:
			highscore_array[i].text = str(display_data[i].highscore);
			player_array[i].text = display_data[i].username;

func display_player():
	if rank != -1:
		$Player/Rank.text = str(rank+1);
	$Player/Player.text = Firebase.user_info.username;
	$Player/Highscore.text = str(Gamestate.player_highscore);

func _on_UpdateHighscore_request_completed(result, response_code, headers, body):
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	if response_code != 200:
		print(result_body)

func _on_FetchData_request_completed(result, response_code, headers, body):
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	if response_code == 200:
		var leaderboard: Array = result_body.documents
		for i in range (leaderboard.size()):
			var entry = leaderboard[i].fields
			if str(leaderboard[i].name).ends_with(Firebase.user_info.id):
				rank = i;
			# append the entry to the leaderboard display data
			display_data.append({
				'highscore': entry.highscore.integerValue,
				'username': entry.username.stringValue,
			})
			display_data.sort_custom(self,"sort_descending")

	else:
		print('Error fetching leaderboard data:')
		print(result_body);

func reset():
	display_data = []
	for i in range(5):
		highscore_array[i].text = "-";
		player_array[i].text = "-";


func _on_Home_pressed():
	visible = false
	get_tree().call_group('Interface','to_home','Leaderboard')
