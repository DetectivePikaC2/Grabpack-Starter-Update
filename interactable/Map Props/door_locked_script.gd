extends Node3D

var selected = false

func _input(event):
	if Input.is_action_just_pressed("interact") and selected:
		$anim.play("open")

func _on_collision_area_entered(area):
	selected = true

func _on_collision_area_exited(area):
	selected = false
