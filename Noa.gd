extends Spatial

func _ready():
	Gamestate.load_playerData();
	Generator.generate();

func at_home():
	Generator.generate()
