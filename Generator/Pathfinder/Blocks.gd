extends Node

# --------- Scenes -----------

# Cube TSCNs
const Cube1x1H_V1 = preload("res://Generator/MapElements/Blocks/Cube1x1H-V1.tscn")
const Cube1x1H_V2 = preload("res://Generator/MapElements/Blocks/Cube1x1H-V2.tscn")
const Cube1x1L_V1 = preload("res://Generator/MapElements/Blocks/Cube1x1L-V1.tscn")
const Cube1x1L_V2 = preload("res://Generator/MapElements/Blocks/Cube1x1L-V2.tscn")
const Cube1x1L_V3 = preload("res://Generator/MapElements/Blocks/Cube1x1L-V3.tscn")
const Cube1x5H_V1 = preload("res://Generator/MapElements/Blocks/Cube1x5H-V1.tscn")

# Tower TSCNs
const Tower1x1H_V1 = preload("res://Generator/MapElements/Blocks/Tower1x1H-V1.tscn")

# Tunnel TSCNs
const Tunnel1x5H = preload("res://Generator/MapElements/Blocks/Tunnel1x5H.tscn")

# Bridge TSCNs
const Bridge1x5H = preload("res://Generator/MapElements/Blocks/Bridge1x5H.tscn")
const Bridge1x9H = preload("res://Generator/MapElements/Blocks/Bridge1x9H.tscn")

# ------ Probabilities -------- 

# Type: Cube - P = 0.825
const P_Cube1x1H_V1 = 0
const P_Cube1x1H_V2 = 0.5
const P_Cube1x1L_V1 = 0.825
const P_Cube1x1L_V2 = 0
const P_Cube1x1L_V3 = 0
const P_Cube1x5H_V1 = 0

# Type: Tower - P = 0.85
const P_Tower1x1H_V1 = 0.85

# Type: Tunnel - P = 0.90
const P_Tunnel1x5H = 0.90

# Type: Bridge - P = 1.00
const P_Bridge1x5H = 0
const P_Bridge1x9H = 0

func _ready():
	randomize()

func create():
	var q = randf()
	# Cubes - P = 0.8
	if q <= P_Cube1x1H_V1:
		ElementFactory.new_element(Cube1x1H_V1)
	elif q <= P_Cube1x1H_V2:
		ElementFactory.new_element(Cube1x1H_V2)
	elif q <= P_Cube1x1L_V1:
		ElementFactory.new_element(Cube1x1L_V1)
	elif q <= P_Cube1x1L_V2:
		ElementFactory.new_element(Cube1x1L_V2)
	elif q <= P_Cube1x1L_V3:
		ElementFactory.new_element(Cube1x1L_V3)
	# Tower - P = 0.825
	elif q <= P_Tower1x1H_V1:
		ElementFactory.new_element(Tower1x1H_V1)
	# Tunnels - P = 0.90
	elif q <= P_Tunnel1x5H:
		ElementFactory.new_element(Tunnel1x5H)
	# Bridges - P = 1.00
	elif q <= P_Bridge1x5H:
		ElementFactory.new_element(Bridge1x5H)
	elif q <= P_Bridge1x9H:
		ElementFactory.new_element(Bridge1x9H)
