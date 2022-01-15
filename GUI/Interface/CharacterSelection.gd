extends Control

const ButtonTextureNormalNoa = preload("res://Assets/GFX/Interface/CharacterPngs/Noa.png")
const ButtonTextureNormalArun = preload("res://Assets/GFX/Interface/CharacterPngs/Arun.png")
const ButtonTextureNormalIsra = preload("res://Assets/GFX/Interface/CharacterPngs/Isra.png")
const ButtonTextureNormalKaida = preload("res://Assets/GFX/Interface/CharacterPngs/Kaida.png")
const ButtonTextureNormalMamoru = preload("res://Assets/GFX/Interface/CharacterPngs/Mamoru.png")

const texture_array = [
	ButtonTextureNormalNoa,
	ButtonTextureNormalArun,
	ButtonTextureNormalIsra,
	ButtonTextureNormalKaida,
	ButtonTextureNormalMamoru,
]

const ButtonTextureNoaLocked = preload("res://Assets/GFX/Interface/CharacterPngs/Noa.png") 
const ButtonTextureArunLocked = preload("res://Assets/GFX/Interface/CharacterPngs/ArunDisabled.png") 
const ButtonTextureKaidaLocked = preload("res://Assets/GFX/Interface/CharacterPngs/KaidaDisabled.png") 
const ButtonTextureMamoruLocked = preload("res://Assets/GFX/Interface/CharacterPngs/MamoruDisabled.png") 
const ButtonTextureIsraLocked = preload("res://Assets/GFX/Interface/CharacterPngs/IsraDisabled.png") 

const texture_locked_array = [
	ButtonTextureNoaLocked,
	ButtonTextureArunLocked,
	ButtonTextureKaidaLocked,
	ButtonTextureMamoruLocked,
	ButtonTextureIsraLocked,
]

const description_array = [
	'Noa',
	'Arun',
	'Isra',
	'Kaida',
	'Mamoru'
]

var index = 0

func _ready():
	$Previous.visible = false;

func display_chars():
	# load button textures
	$CharButtonLeft.texture_normal = texture_array[index];
	$CharButtonMid.texture_normal = texture_array[index+1];
	$CharButtonRight.texture_normal = texture_array[index+2];
	# load descriptions
	$CharLabelLeft.text = description_array[index]
	$CharLabelMid.text = description_array[index+1]
	$CharLabelRight.text = description_array[index+2]
	# only enable chars the player owns
	$CharButtonLeft.texture_disabled = texture_locked_array[index];
	$CharButtonMid.texture_disabled = texture_locked_array[index+1];
	$CharButtonRight.texture_disabled = texture_locked_array[index+2];
	# only enable chars the player owns
	$CharButtonLeft.disabled = not Gamestate.player_chars[index];
	$CharButtonMid.disabled = not Gamestate.player_chars[index+1];
	$CharButtonRight.disabled = not Gamestate.player_chars[index+2];

func _on_Return_pressed():
	switch_to_home()

func switch_to_home():
	visible = false;
	get_tree().call_group("Interface", "to_home", 'Selection');

func to_selection():
	display_chars();
	visible = true;


func _on_Next_pressed():
	index += 1;
	display_chars();
	if index == texture_array.size() - 3:
		$Next.visible = false;
	$Previous.visible = true;


func _on_Previous_pressed():
	index -= 1;
	display_chars();
	if index == 0:
		$Previous.visible = false;
	$Next.visible = true;


func _on_CharButtonLeft_pressed():
	swap_charactere(index);
	switch_to_home()

func _on_CharButtonMid_pressed():
	swap_charactere(index+1);
	switch_to_home()

func _on_CharButtonRight_pressed():
	swap_charactere(index+2);
	switch_to_home()

func swap_charactere(i):
	CharacterTextureLoader.switch_char(CharacterTextureLoader.NOA)

func remove_char():
	var char_node = get_tree().get_root().find_node("Char",true,false);
	char_node.free();

func instance_char_node(node_tscn):
	var instance = node_tscn.instance();
	print(node_tscn)
	print(instance.name)
	instance.name = 'Char';
	var root = get_tree().get_root().find_node("Noa",true,false);
	root.add_child(instance)
	instance.reset();
