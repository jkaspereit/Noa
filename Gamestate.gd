extends Node

var gamestate := {
	"exp": {},
	"coins": {},
	"highscore": {},
}

var player_exp = 0;
var player_coins = 0;
var player_highscore = 0;
var player_chars = [1,0,0,0,0];

var distance = 0
var coins = 0
var spikes = 0
var gaps = 0

func _ready():
	var http = HTTPRequest.new();
	add_child(http);
	add_to_group("Interface")

func coin_collected():
	coins += 1

func raise_distance():
	distance += 1;

func spike_passed():
	spikes += 1;

func gap_passed():
	gaps += 1;

func game_over():
	var score = calculate_score()
	player_exp += score;
	if(player_highscore < score):
		player_highscore = score;
	player_coins += coins;
	# save to db
	gamestate.exp = {
		'integerValue': 5,
	}
	gamestate.coins = {
		'integerValue': 5,
	}
	gamestate.highscore = {
		'integerValue': 5,
	}
	Firebase.save_document('players?documentId=%s' % Firebase.user_info.id,gamestate)
	print('saved')
	# reset ingame values
	distance = 0
	coins = 0
	spikes = 0
	gaps = 0


func calculate_score():
	return (distance*10) + (coins * 20) + (spikes*15) + (gaps*15)


# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var response = parse_json(body.get_string_from_utf8())

	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
	print(response)
