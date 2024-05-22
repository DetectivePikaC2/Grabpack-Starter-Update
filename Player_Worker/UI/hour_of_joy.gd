extends Control

func _on_timer_timeout():
	$VideoStreamPlayer.play()

func _on_video_stream_player_finished():
	$AnimationPlayer.play("fade")

func _on_animation_player_animation_finished(anim_name):
	get_tree().quit()
