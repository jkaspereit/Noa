extends Control

const Noa = preload("res://Characters/Noa/Noa.tscn")
const Arun = preload("res://Characters/Arun/Arun.tscn")
const Isra = preload("res://Characters/Isra/Isra.tscn")
const Kaida = preload("res://Characters/Kaida/Kaida.tscn")
const Mamoru = preload("res://Characters/Mamoru/Mamoru.tscn")

const char_array = [
	Noa,
	Arun,
	Isra,
	Kaida,
	Mamoru
]

const ButtonTextureNormalNoa = preload("res://Assets/GFX/Characters/Noa/ButtonNormalTexture.png")
const ButtonTextureNormalArun = preload("res://Assets/GFX/Characters/Arun/ButtonNormalTexture.png")
const ButtonTextureNormalIsra = preload("res://Assets/GFX/Characters/Isra/ButtonNormalTexture.png")
const ButtonTextureNormalKaida = preload("res://Assets/GFX/Characters/Kaida/ButtonNormalTexture.png")
const ButtonTextureNormalMamoru = preload("res://Assets/GFX/Characters/Mamoru/ButtonNormalTexture.png")

const texture_array = [
	ButtonTextureNormalNoa,
	ButtonTextureNormalArun,
	ButtonTextureNormalIsra,
	ButtonTextureNormalKaida,
	ButtonTextureNormalMamoru,
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
	$Previous.disabled = true;
	display_chars();

func display_chars():
	$CharButtonLeft.texture_normal = texture_array[index];
	$CharButtonMid.texture_normal = texture_array[index+1];
	$CharButtonRight.texture_normal = texture_array[index+2];
	$CharLabelLeft.text = description_array[index]
	$CharLabelMid.text = description_array[index+1]
	$CharLabelRight.text = description_array[index+2]

func _on_Return_pressed():
	get_tree().call_group("Interface", "to_home");

func to_home():
	visible = false;

func to_settings():
	visible = true;

func _on_Next_pressed():
	index += 1;
	display_chars();
	if index == texture_array.size() - 3:
		$Next.disabled = true;
	$Previous.disabled = false;


func _on_Previous_pressed():
	index -= 1;
	display_chars();
	if index == 0:
		$Previous.disabled = true;
	$Next.disabled = false;


func _on_CharButtonLeft_pressed():
	swap_charactere(index);
	get_tree().call_group("Interface", "to_home");

func _on_CharButtonMid_pressed():
	swap_charactere(index+1);
	get_tree().call_group("Interface", "to_home");

func _on_CharButtonRight_pressed():
	swap_charactere(index+2);
	get_tree().call_group("Interface", "to_home");

func swap_charactere(i):
	remove_char();
	instance_char_node(char_array[i])

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
