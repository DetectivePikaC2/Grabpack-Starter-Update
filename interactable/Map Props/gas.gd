@tool
extends Node3D

@export_category("Settings")
@export var size = Vector3(2, 2, 2)

var in_gas = false

func _ready():
	scale = size

func _process(delta):
	scale = size
	if in_gas and not Worker.gas_enabled:
		get_tree().call_group("Player", "Die")

func _on_area_area_entered(area):
	in_gas = true

func _on_area_area_exited(area):
	in_gas = false
