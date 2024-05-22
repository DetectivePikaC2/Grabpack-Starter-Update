extends Node3D

##Set this to the key_id of the door it opens
@export var key_id = 0

var sel = false

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact") and sel:
		$AudioStreamPlayer.play()
		Worker.current_key = key_id
		sel = false
		position.y -= 5000

func _on_ar_area_entered(area):
	sel = true

func _on_ar_area_exited(area):
	sel = false
