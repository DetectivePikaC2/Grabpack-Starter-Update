extends Node3D

var selected = false

func _input(event):
	if Input.is_action_just_pressed("interact") and selected:
		$AudioStreamPlayer.play()
		Worker.has_mask = true
		selected = false
		position.y -= 5000

func _on_item_col_area_entered(area):
	selected = true

func _on_item_col_area_exited(area):
	selected = false

func _on_audio_stream_player_finished():
	queue_free()
