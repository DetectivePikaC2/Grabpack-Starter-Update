extends Node3D

@export_category("Settings")
@export var disabled = false

func _ready():
	if disabled:
		$light.visible = false
	else:
		$light.visible = true

#Right Detection:
func _on_det_area_entered(area):
	if Worker.grappling_use == true:
		Worker.handle_pos = $grab_point_right.global_position
		Worker.handle_rot = $grab_point_right.rotation + rotation
		get_tree().call_group("Player", "p_grabbed_right")

func _on_det_area_exited(area):
	pass # Replace with function body.

#Left Detection:
func _on_det_left_area_entered(area):
	if Worker.left_grappling_use == true:
		Worker.handle_pos_left = $grab_point_left.global_position
		Worker.handle_rot_left = $grab_point_left.rotation + rotation
		get_tree().call_group("Player", "p_grabbed_left")

func _on_det_left_area_exited(area):
	pass # Replace with function body.
