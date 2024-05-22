extends Node3D

var open = false

func open_gate():
	if not open:
		$AnimationPlayer.play("open")
		open = true
