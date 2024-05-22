extends Node3D

@export var lever_number = 0
@export var defualt_status = false
var status = false
var grabbed = false
var grabbed_left = false

func _ready():
	status = defualt_status
	if defualt_status:
		$AnimationPlayer.play("down_start")
	else:
		$AnimationPlayer.play("up_start")

func _process(delta):
	if grabbed and not Worker.grappling_use:
		if status:
			$AnimationPlayer.play("up")
			status = false
			Worker.lever_number = lever_number
			get_tree().call_group("level", "lever_flipped_up")
		else:
			$AnimationPlayer.play("down")
			status = true
			Worker.lever_number = lever_number
			get_tree().call_group("level", "lever_flipped_down")
		$AudioStreamPlayer3D.play()
		grabbed = false
	if grabbed_left and not Worker.left_grappling_use:
		if status:
			$AnimationPlayer.play("up")
			status = false
			Worker.lever_number = lever_number
			get_tree().call_group("level", "lever_flipped_up")
		else:
			$AnimationPlayer.play("down")
			status = true
			Worker.lever_number = lever_number
			get_tree().call_group("level", "lever_flipped_down")
		$AudioStreamPlayer3D.play()
		grabbed_left = false

func _on_col_area_entered(area):
	if Worker.grappling_use:
		Worker.handle_pos = $model/SM_Switch_A_Lever_mo/grab_point.global_position
		Worker.handle_rot = $model/SM_Switch_A_Lever_mo/grab_point.global_rotation
		get_tree().call_group("Player", "lever_grabbed")
		grabbed = true

func _on_col_2_area_entered(area):
	if Worker.left_grappling_use:
		Worker.handle_pos_left = $model/SM_Switch_A_Lever_mo/grab_point_left.global_position
		Worker.handle_rot_left = $model/SM_Switch_A_Lever_mo/grab_point_left.global_rotation
		get_tree().call_group("Player", "lever_grabbed_left")
		grabbed_left = true
