extends Node

const NOA = 0
const ARUN = 1
const ISRA = 2
const KAIDA = 3
const MAMORU = 4

const NOA_TEXTURE_FORWARD = preload("res://Characters/Noa/WalkForward.tres")
const NOA_TEXTURE_FORWARD_JUMP = preload("res://Characters/Noa/WalkForwardJump.tres")
const NOA_TEXTURE_LEFT = preload("res://Characters/Noa/WalkLeft.tres")
const NOA_TEXTURE_LEFT_JUMP = preload("res://Characters/Noa/WalkLeftJump.tres")
const NOA_TEXTURE_RIGHT = preload("res://Characters/Noa/WalkRight.tres")
const NOA_TEXTURE_RIGHT_JUMP = preload("res://Characters/Noa/WalkRightJump.tres")
const NOA_TEXTURE_HOME = preload("res://Characters/Noa/Home.tres")
const NOA_DEATH = preload("res://Characters/Noa/Death.tres")

const ARUN_TEXTURE_FORWARD = preload("res://Characters/Arun/WalkForward.tres")
const ARUN_TEXTURE_FORWARD_JUMP = preload("res://Characters/Arun/WalkForwardJump.tres")
const ARUN_TEXTURE_LEFT = preload("res://Characters/Arun/WalkLeft.tres")
const ARUN_TEXTURE_LEFT_JUMP = preload("res://Characters/Arun/WalkLeftJump.tres")
const ARUN_TEXTURE_RIGHT = preload("res://Characters/Arun/WalkRight.tres")
const ARUN_TEXTURE_RIGHT_JUMP = preload("res://Characters/Arun/WalkRightJump.tres")
const ARUN_TEXTURE_HOME = preload("res://Characters/Arun/Home.tres")
const ARUN_DEATH = preload("res://Characters/Arun/Death.tres")

const ISRA_TEXTURE_FORWARD = preload("res://Characters/Isra/WalkForward.tres")
const ISRA_TEXTURE_FORWARD_JUMP = preload("res://Characters/Isra/WalkForwardJump.tres")
const ISRA_TEXTURE_LEFT = preload("res://Characters/Isra/WalkLeft.tres")
const ISRA_TEXTURE_LEFT_JUMP = preload("res://Characters/Isra/WalkLeftJump.tres")
const ISRA_TEXTURE_RIGHT = preload("res://Characters/Isra/WalkRight.tres")
const ISRA_TEXTURE_RIGHT_JUMP = preload("res://Characters/Isra/WalkRightJump.tres")
const ISRA_TEXTURE_HOME = preload("res://Characters/Isra/Home.tres")
const ISRA_DEATH = preload("res://Characters/Isra/Death.tres")

const KAIDA_TEXTURE_FORWARD = preload("res://Characters/Kaida/WalkForward.tres")
const KAIDA_TEXTURE_FORWARD_JUMP = preload("res://Characters/Kaida/WalkForwardJump.tres")
const KAIDA_TEXTURE_LEFT = preload("res://Characters/Kaida/WalkLeft.tres")
const KAIDA_TEXTURE_LEFT_JUMP = preload("res://Characters/Kaida/WalkLeftJump.tres")
const KAIDA_TEXTURE_RIGHT = preload("res://Characters/Kaida/WalkRight.tres")
const KAIDA_TEXTURE_RIGHT_JUMP = preload("res://Characters/Kaida/WalkRightJump.tres")
const KAIDA_TEXTURE_HOME = preload("res://Characters/Kaida/Home.tres")
const KAIDA_DEATH = preload("res://Characters/Kaida/Death.tres")

const MAMORU_TEXTURE_FORWARD = preload("res://Characters/Mamoru/WalkForward.tres")
const MAMORU_TEXTURE_FORWARD_JUMP = preload("res://Characters/Mamoru/WalkForwardJump.tres")
const MAMORU_TEXTURE_LEFT = preload("res://Characters/Mamoru/WalkLeft.tres")
const MAMORU_TEXTURE_LEFT_JUMP = preload("res://Characters/Mamoru/WalkLeftJump.tres")
const MAMORU_TEXTURE_RIGHT = preload("res://Characters/Mamoru/WalkRight.tres")
const MAMORU_TEXTURE_RIGHT_JUMP = preload("res://Characters/Mamoru/WalkRightJump.tres")
const MAMORU_TEXTURE_HOME = preload("res://Characters/Mamoru/Home.tres")
const MAMORU_DEATH = preload("res://Characters/Mamoru/Death.tres")

var active = NOA

func switch_char(character):
	active = character

func get_jump_forward():
	match active:
		NOA: return NOA_TEXTURE_FORWARD_JUMP
		ARUN: return ARUN_TEXTURE_FORWARD_JUMP
		ISRA: return ISRA_TEXTURE_FORWARD_JUMP
		KAIDA: return KAIDA_TEXTURE_FORWARD_JUMP
		MAMORU: return MAMORU_TEXTURE_FORWARD_JUMP

func get_jump_left():
	match active:
		NOA: return NOA_TEXTURE_LEFT_JUMP
		ARUN: return ARUN_TEXTURE_LEFT_JUMP
		ISRA: return ISRA_TEXTURE_LEFT_JUMP
		KAIDA: return KAIDA_TEXTURE_LEFT_JUMP
		MAMORU: return MAMORU_TEXTURE_LEFT_JUMP

func get_jump_right():
	match active:
		NOA: return NOA_TEXTURE_RIGHT_JUMP
		ARUN: return ARUN_TEXTURE_RIGHT_JUMP
		ISRA: return ISRA_TEXTURE_RIGHT_JUMP
		KAIDA: return KAIDA_TEXTURE_RIGHT_JUMP
		MAMORU: return MAMORU_TEXTURE_RIGHT_JUMP


func get_forward():
	match active:
		NOA: return NOA_TEXTURE_FORWARD
		ARUN: return ARUN_TEXTURE_FORWARD
		ISRA: return ISRA_TEXTURE_FORWARD
		KAIDA: return KAIDA_TEXTURE_FORWARD
		MAMORU: return MAMORU_TEXTURE_FORWARD

func get_left():
	match active:
		NOA: return NOA_TEXTURE_LEFT
		ARUN: return ARUN_TEXTURE_LEFT
		ISRA: return ISRA_TEXTURE_LEFT
		KAIDA: return KAIDA_TEXTURE_LEFT
		MAMORU: return MAMORU_TEXTURE_LEFT

func get_right():
	match active:
		NOA: return NOA_TEXTURE_RIGHT
		ARUN: return ARUN_TEXTURE_RIGHT
		ISRA: return ISRA_TEXTURE_RIGHT
		KAIDA: return KAIDA_TEXTURE_RIGHT
		MAMORU: return MAMORU_TEXTURE_RIGHT

func get_idle():
	match active:
		NOA: return NOA_TEXTURE_HOME
		ARUN: return ARUN_TEXTURE_HOME
		ISRA: return ISRA_TEXTURE_HOME
		KAIDA: return KAIDA_TEXTURE_HOME
		MAMORU: return MAMORU_TEXTURE_HOME
