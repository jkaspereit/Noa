extends Node

var player := {
	"exp": {},
	"coins": {},
	"highscore": {},
	"chars": {}
}

var http;

var new_player = false;

var player_exp = 0;
var player_coins = 0;
var player_highscore = 0;
var player_chars = [true,false,false,false,false];

var distance = 0
var coins = 0
var spikes = 0
var gaps = 0

func _ready():
	# create and connect to a HTTPRequest-Node
	http = HTTPRequest.new();
	add_child(http);
	http.connect("request_completed", self, "_http_request_completed")
	# join group: Interface
	add_to_group("Interface")

# is called by noa tscn to load player data
func load_playerData():
	Firebase.get_document("players/%s" % Firebase.user_info.id, http)

func coin_collected():
	coins += 1

func raise_distance():
	distance += 1;

func spike_passed():
	spikes += 1;

func gap_passed():
	gaps += 1;

func play():
	# reset values for a new run
	reset_values();

func game_over():
	# update players values based on the last run
	update_player();
	# store progress in firestore
	save_progress();

func update_player():
	var score = calculate_score()
	player_exp += score;
	if(player_highscore < score):
		player_highscore = score;
	player_coins += coins;

# calculates the score of a run
func calculate_score():
	return (distance*10) + (coins * 20) + (spikes*15) + (gaps*15)

# resets all values which are set due playing
func reset_values():
	distance = 0
	coins = 0
	spikes = 0
	gaps = 0

# save player progress to firestore
func save_progress():
	# firestore has a special structure
	# therefore you have to add value types to the dictonary
	player.exp = {
		'integerValue': player_exp,
	}
	player.coins = {
		'integerValue': player_coins,
	}
	player.highscore = {
		'integerValue': player_highscore,
	}
	player.chars = {
		'arrayValue':{
			'values': [
				{'booleanValue':player_chars[0]},
				{'booleanValue':player_chars[1]},
				{'booleanValue':player_chars[2]},
				{'booleanValue':player_chars[3]},
				{'booleanValue':player_chars[4]},
			]
		}
	}
	if new_player:
		Firebase.save_document('players?documentId=%s' % Firebase.user_info.id,player,http)
	else:
		Firebase.update_document('players/%s' % Firebase.user_info.id,player,http)

# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var result_body := JSON.parse(body.get_string_from_ascii()).result as Dictionary
	print('Response Player Progress:')
	print(result_body)
	match response_code:
		404:
			# no player data found => it's a new profile
			new_player = true
			return
		200:
			self.player = result_body.fields
			player_exp = int(player.exp.integerValue)
			player_coins = int(player.coins.integerValue)
			player_highscore = int(player.highscore.integerValue)
			player_chars[0] = player.chars.arrayValue.values[0].booleanValue;
			player_chars[1] = player.chars.arrayValue.values[1].booleanValue;
			player_chars[2] = player.chars.arrayValue.values[2].booleanValue;
			player_chars[3] = player.chars.arrayValue.values[3].booleanValue;
			player_chars[4] = player.chars.arrayValue.values[4].booleanValue;
