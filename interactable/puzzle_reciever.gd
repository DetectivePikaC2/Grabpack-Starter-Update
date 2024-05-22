extends Node3D

@export_category("Settings")
@export var reciever_id = 0

var solved = false

func _ready():
	pass
#Right Detection:
func _on_det_right_area_entered(area):
	if Worker.grappling_use == true:
		Worker.handle_pos = $grab_point_right.global_position
		Worker.handle_rot = $grab_point_right.rotation + rotation
		get_tree().call_group("Player", "r_grabbed_right")
		if Worker.grip and not solved:
			$light.visible = true
			$complete.play()
			Worker.puzzle_rev_id = reciever_id
			get_tree().call_group("level", "puzzle_complete")
			solved = true

func _on_det_right_area_exited(area):
	pass # Replace with function body.

#Left Detection:
func _on_det_left_area_entered(area):
	if Worker.left_grappling_use == true:
		Worker.handle_pos_left = $grab_point_left.global_position
		Worker.handle_rot_left = $grab_point_left.rotation + rotation
		get_tree().call_group("Player", "r_grabbed_left")
		if Worker.grip and not solved:
			$light.visible = true
			$complete.play()
			Worker.puzzle_rev_id = reciever_id
			get_tree().call_group("level", "puzzle_complete")
			solved = true

func _on_det_left_area_exited(area):
	pass # Replace with function body.
