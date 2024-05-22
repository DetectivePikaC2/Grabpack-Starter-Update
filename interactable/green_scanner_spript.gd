extends Node3D

@export var scanner_number = 0
@export var panel_disabled = false

func _ready():
	$scanner_anim.play("blank")
	if panel_disabled:
		$scanlines/Cube_034/Cube_034_Material_006_0.visible = false
		$OmniLight3D.visible = false

func _on_auto_1_area_entered(area):
	Worker.green_scanner_number = scanner_number
	get_tree().call_group("level", "green_panel_finish")
	panel_disabled = true

func _on_det_area_exited(area):
	if not panel_disabled:
		$scanner_anim.play("blank")
		$scanlines/scan_sfx.stop()

func _on_det_area_entered(area):
	if Worker.current_hand == 0:
		if Worker.grappling_use and not panel_disabled:
			Worker.handle_pos = $grab_point.global_position
			Worker.handle_rot = $grab_point.global_rotation
			get_tree().call_group("Player", "green_panel_grabbed")
			$scanlines/scan_sfx.play()
			$scanner_anim.play("scan_backwards")
		elif Worker.grappling_use and panel_disabled:
			Worker.handle_pos = $grab_point.global_position
			Worker.handle_rot = $grab_point.global_rotation
			get_tree().call_group("Player", "green_panel_grabbed")

func power_on():
	$scanlines/Cube_034/Cube_034_Material_006_0.visible = true
	$OmniLight3D.visible = true
	panel_disabled = false

func power_off():
	$scanlines/Cube_034/Cube_034_Material_006_0.visible = false
	$OmniLight3D.visible = false
	panel_disabled = true
