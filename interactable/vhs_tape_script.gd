extends Node3D

@export var vhs_id = 0
@export var vhs_name = "name"
@export var font_size = 42

var selected = false

func _ready():
	$Label3D.text = vhs_name
	$Label3D.font_size = font_size

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact") and selected:
		position.y += 5000
		Worker.current_vhs = vhs_id
		$AudioStreamPlayer3D.play()
		get_tree().call_group("level", "vhs_collected")

func _on_audio_stream_player_3d_finished():
	queue_free()

func _on_collision_area_entered(area):
	selected = true

func _on_collision_area_exited(area):
	selected = false
