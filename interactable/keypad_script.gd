extends Node3D

@export var keypad_number = 0
@export var BTN1 = 0
@export var BTN2 = 0
@export var BTN3 = 0
@export var BTN4 = 0
@export var disabled = false

var current_selected = 0

var key1 = 0
var key2 = 0
var key3 = 0
var key4 = 0

func _unhandled_input(event):
	if not disabled and Input.is_action_just_pressed("interact") and current_selected > 0:
		if current_selected == 1:
			$AnimationPlayer.play("1")
		elif current_selected == 2:
			$AnimationPlayer.play("2")
		elif current_selected == 3:
			$AnimationPlayer.play("3")
		elif current_selected == 4:
			$AnimationPlayer.play("4")
		elif current_selected == 5:
			$AnimationPlayer.play("5")
		elif current_selected == 6:
			$AnimationPlayer.play("6")
		elif current_selected == 7:
			$AnimationPlayer.play("7")
		elif current_selected == 8:
			$AnimationPlayer.play("8")
		elif current_selected == 9:
			$AnimationPlayer.play("9")
		$press.play()
		if not key1 > 0:
			key1 = current_selected
		elif not key2 > 0:
			key2 = current_selected
		elif not key3 > 0:
			key3 = current_selected
		elif not key4 > 0:
			key4 = current_selected
			if key1 == BTN1 and key2 == BTN2 and key3 == BTN3 and key4 == BTN4:
				success()
			else:
				fail_keys()

func success():
	Worker.keypad_number = keypad_number
	$success.play()
	get_tree().call_group("level", "keypad_finish")
	disabled = true

func fail_keys():
	$fail.play()
	key1 = 0
	key2 = 0
	key3 = 0
	key4 = 0

func _on_btn_1_col_area_entered(area):
	current_selected = 1

func _on_btn_2_col_area_entered(area):
	current_selected = 2

func _on_btn_3_col_area_entered(area):
	current_selected = 3

func _on_btn_4_col_area_entered(area):
	current_selected = 4

func _on_btn_5_col_area_entered(area):
	current_selected = 5

func _on_btn_6_col_area_entered(area):
	current_selected = 6

func _on_btn_7_col_area_entered(area):
	current_selected = 7

func _on_btn_8_col_area_entered(area):
	current_selected = 8

func _on_btn_9_col_area_entered(area):
	current_selected = 9

func _on_btn_1_col_23_area_entered(area):
	current_selected = 0

func _on_btn_end_col_2_area_entered(area):
	current_selected = 0

func _on_btn_end_col_3_area_entered(area):
	current_selected = 0

func _on_btn_end_col_4_area_entered(area):
	current_selected = 0
