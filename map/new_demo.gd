extends Node3D

var flare_timer = 0

var wall1 = true
var wall2 = true

var panel1 = false
var panel2 = false

@onready var player = $Player

func _physics_process(delta):
	get_tree().call_group("enemy", "update_target_location", player.global_transform.origin)

func _process(delta):
	if flare_timer > 0:
		flare_timer += 1
	if flare_timer == 5:
		$Player/layer1/Grab_layer1/Grab_layer2/Grab_layer3/RootNode/right_hands/Hand_Flare/flare.reparent($flare_container)
	if flare_timer == 10:
		summon()
		flare_timer = 0

func flare_spawned():
	flare_timer = 1

func summon():
	get_tree().call_group("flare", "flare_update")

func check_socket():
	pass

func reciever_active():
	pass

func battery_rev_complete():
	check_socket()

func blue_panel_finish():
	if Worker.blue_scanner_number == 0:
		panel1 = true
	check_panels()
func green_panel_finish():
	if Worker.green_scanner_number == 0:
		panel2 = true
	check_panels()

func check_panels():
	if panel1 and panel2:
		$"objects/Large Gate".call("open_gate")

func lever_flipped_up():
	if Worker.lever_number == 0:
		_toggle_wall1()
	elif  Worker.lever_number == 1:
		_toggle_wall2()
func lever_flipped_down():
	if Worker.lever_number == 0:
		_toggle_wall1()
	elif  Worker.lever_number == 1:
		_toggle_wall2()

func _toggle_wall1():
	if wall1:
		$lvl/wall_anim.play("wall1")
	else:
		$lvl/wall_anim.play_backwards("wall1")
	wall1 = !wall1

func _toggle_wall2():
	if wall2:
		$lvl/wall_anim.play("wall2")
	else:
		$lvl/wall_anim.play_backwards("wall2")
	wall2 = !wall2

func keypad_finish():
	if Worker.keypad_number == 1:
		$objects/Door_Basic2.locked = false

func vhs_finished():
	pass
