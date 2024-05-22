extends Node3D

##If enabled, when the door is openned, the player is teleported to the selected level
@export var load_next_level_when_openned = false
##The scene path of the level you want the door to take you do, does nothing of "Load Next Level When Openned" is disabled
@export var level_file_path = "none"
##If enabled, the door is locked
@export var locked = false
##If the door is locked, set this to a random number. Then set the key_id of the key that opens this door to this doors key_id
@export var key_id = 0
##Watch the tutorial to figure out what this is
@export var event_id = 0

var selected = false
var open = false

func _input(event):
	if Input.is_action_just_pressed("interact") and selected and not locked and not open:
		$anim.play("open")
		Worker.door_event_id = event_id
		get_tree().call_group("level", "door_openned")
		open = true
		if load_next_level_when_openned:
			Worker.load_path = level_file_path
			get_tree().call_group("Player", "level_finish")
	if Input.is_action_just_pressed("interact") and selected and locked and key_id > 0 and not open:
		if Worker.current_key == key_id:
			$anim.play("open")
			Worker.door_event_id = event_id
			get_tree().call_group("level", "door_openned")
			open = true
			if load_next_level_when_openned:
				Worker.load_path = level_file_path
				get_tree().call_group("Player", "level_finish")
		else:
			$anim.play("locked")
	elif Input.is_action_just_pressed("interact") and selected and locked and not open:
		$anim.play("locked")

func _on_collision_area_entered(area):
	selected = true

func _on_collision_area_exited(area):
	selected = false
