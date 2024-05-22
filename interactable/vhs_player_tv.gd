extends Node3D

@export var vhs_id = 0
@export var video_path = "none"

func play_tape():
	if Worker.vhs_id == vhs_id:
		$RootNode/SubViewport/VideoStreamPlayer.stream = load(video_path)
		$RootNode/SubViewport/VideoStreamPlayer.play()

func _on_video_stream_player_finished():
	Worker.vhs_id = vhs_id
	get_tree().call_group("level", "vhs_finished")
