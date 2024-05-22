extends Control

var open = false

func toggle_menu():
	if open:
		close_menu()
	else:
		load_menu()

func load_menu():
	enable_all()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	visible = true
	open = true

func close_menu():
	disable_all()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false
	open = false

func enable_all():
	$main/buttons/resume.disabled = false
	$main/buttons/load.disabled = false
	$main/buttons/title.disabled = false
	$main/buttons/quit.disabled = false

func disable_all():
	$main/buttons/resume.disabled = true
	$main/buttons/load.disabled = true
	$main/buttons/title.disabled = true
	$main/buttons/quit.disabled = true

func _on_resume_pressed():
	close_menu()

func _on_load_pressed():
	get_tree().call_group("Player", "reload_level")

func _on_title_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
