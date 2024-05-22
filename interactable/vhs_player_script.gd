extends Node3D

@export var vhs_id = 0

var selected = false
var used = false

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact") and selected and not used and Worker.current_vhs == vhs_id:
		used = true
		Worker.vhs_id = vhs_id
		$AnimationPlayer.play("insert")
		$Timer.start()

func _on_collision_area_entered(area):
	selected = true

func _on_collision_area_exited(area):
	selected = false

func _on_timer_timeout():
	get_tree().call_group("vhs_tv", "play_tape")
