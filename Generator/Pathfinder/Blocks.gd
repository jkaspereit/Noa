extends Node

# --------- Scenes -----------

# Cube TSCNs
const Cube1x1H = preload("res://Generator/MapElements/Blocks/Cube1x1H.tscn")
const Cube1x1L = preload("res://Generator/MapElements/Blocks/Cube1x1L.tscn")
const Cube1x5H = preload("res://Generator/MapElements/Blocks/Cube1x5H.tscn")

# Tower TSCNs
const Tower = preload("res://Generator/MapElements/Blocks/Tower.tscn")

# Tunnel TSCNs
const Tunnel = preload("res://Generator/MapElements/Blocks/Tunnel.tscn")

# Bridge TSCNs
const Bridge = preload("res://Generator/MapElements/Blocks/Bridge.tscn")
const BridgeLong = preload("res://Generator/MapElements/Blocks/BridgeLong.tscn")

# ------ Probabilities -------- 

# Type: Cube - P = 0.825
const P_Cube1x1H = 0.25
const P_Cube1x1L = 0.5
const P_Cube1x5H = 0.825

# Type: Tower - P = 0.85
const P_Tower = 0.85

# Type: Tunnel - P = 0.90
const P_Tunnel= 0.90

# Type: Bridge - P = 1.00
const P_Bridge = 0.95
const P_BridgeLong = 1

func _ready():
	randomize()

func create():
	var q = randf()
	# Cubes - P = 0.825
	if q <= P_Cube1x1H:
		ElementFactory.new_element(Cube1x1H)
	elif q <= P_Cube1x1L:
		ElementFactory.new_element(Cube1x1L)
	elif q <= P_Cube1x5H:
		ElementFactory.new_element(Cube1x5H)
	# Tower - P = 0.85
	elif q <= P_Tower:
		ElementFactory.new_element(Tower)
	# Tunnels - P = 0.90
	elif q <= P_Tunnel:
		ElementFactory.new_element(Tunnel)
	# Bridges - P = 1.00
	elif q <= P_Bridge:
		ElementFactory.new_element(Bridge)
	elif q <= P_BridgeLong:
		ElementFactory.new_element(BridgeLong)
