extends Control

const description_array = [
	'Noa',
	'Arun',
	'Isra',
	'Kaida',
	'Mamoru',
]

const TextureNoa = preload("res://Assets/GFX/Interface/CharacterPngs/Noa.png")
const TextureArun = preload("res://Assets/GFX/Interface/CharacterPngs/Arun.png")
const TextureIsra = preload("res://Assets/GFX/Interface/CharacterPngs/Isra.png")
const TextureKaida = preload("res://Assets/GFX/Interface/CharacterPngs/Kaida.png")
const TextureMamoru = preload("res://Assets/GFX/Interface/CharacterPngs/Mamoru.png")

const char_texture_array = [
	TextureNoa,
	TextureArun,
	TextureIsra,
	TextureKaida,
	TextureMamoru,
]

const Price150 = preload("res://Assets/GFX/Interface/Shop/CoinPrice150.PNG")
const Price300 = preload("res://Assets/GFX/Interface/Shop/CoinPrice300.PNG")
const Price450 = preload("res://Assets/GFX/Interface/Shop/CoinPrice450.PNG")
const Price777 = preload("res://Assets/GFX/Interface/Shop/CoinPrice777.PNG")

const Unlocked = preload("res://Assets/GFX/Interface/Shop/CharacterUnlocked.PNG")

var price_texture_array = [
	Unlocked,
	Price150,
	Price300,
	Price450,
	Price777
]

var index = 0

func _ready():
	$Previous.visible = false;
	# if the player owns the character already,
	# the button will be disabled and display it unlocked
	$PriceLeft.texture_disabled = Unlocked;
	$PriceMid.texture_disabled = Unlocked;
	$PriceRight.texture_disabled = Unlocked;
	display();

func display():
	# load description
	$DescriptionLeft.text = description_array[index];
	$DescriptionMid.text = description_array[index+1];
	$DescriptionRight.text = description_array[index+2];
	# load characters
	$CharLeft.texture = char_texture_array[index];
	$CharMid.texture = char_texture_array[index+1];
	$CharRight.texture = char_texture_array[index+2];
	# load prices
	$PriceLeft.texture_normal = price_texture_array[index]
	$PriceMid.texture_normal = price_texture_array[index+1]
	$PriceRight.texture_normal = price_texture_array[index+2]
	# if the player has unloacked a char, disable the button
	$PriceLeft.disabled = Gamestate.player_chars[index];
	$PriceMid.disabled = Gamestate.player_chars[index+1];
	$PriceRight.disabled = Gamestate.player_chars[index+2];

func _on_Return_pressed():
	get_tree().call_group("Interface", "to_home");

func to_home():
	visible = false;

func to_shop():
	visible = true;

func _on_Next_pressed():
	index += 1;
	display();
	if index == description_array.size() - 3:
		$Next.visible = false;
	$Previous.visible = true;


func _on_Previous_pressed():
	index -= 1;
	display();
	if index == 0:
		$Previous.visible = false;
	$Next.visible = true;

func _on_PriceLeft_pressed():
	buy_character(index)

func _on_PriceMid_button_down():
	buy_character(index+1)

func _on_PriceRight_button_down():
	buy_character(index+2)

func buy_character(index):
	var price = get_price(index);
	if Gamestate.player_coins >= price:
		Gamestate.player_coins -= price
		Gamestate.player_chars[index] = true
		Gamestate.save_progress()

func get_price(index) -> int:
	match index:
		1: return 150;
		2: return 300;
		3: return 450;
		4: return 777;
	return 0;
