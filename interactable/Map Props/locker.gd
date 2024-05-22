extends Node3D

var selected = false
var player_entered = false
var can_toggle = true

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact") and selected and can_toggle:
		if not player_entered:
			print("entered")
			$CanvasLayer/Label.visible = false
			$Camera3D.current = true
			$model/AnimationPlayer.play("SK_LockerHuggy_ao|A_Locker_LockerOpen")
			Worker.allow_movement = false
			can_toggle = false
			player_entered = true
		else:
			print("exited")
			$CanvasLayer/Label.visible = false
			$Camera3D.current = true
			$model/AnimationPlayer.play("SK_LockerHuggy_ao|A_Locker_LockerExit")
			Worker.allow_movement = false
			can_toggle = false
			player_entered = false

func _on_det_area_entered(area):
	selected = true

func _on_det_area_exited(area):
	selected = false

func _on_animdet_2_area_entered(area):
	if player_entered:
		$model/AnimationPlayer.play("idle")
		$CanvasLayer/Label.visible = true
	else:
		Worker.allow_movement = true
		get_tree().call_group("Player", "_locker_exit")
		$Camera3D.current = false
	can_toggle = true
