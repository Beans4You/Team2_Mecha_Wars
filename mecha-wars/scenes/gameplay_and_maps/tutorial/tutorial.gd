extends Node

@onready var placing_active = false

@onready var starting_gold = 800
@onready var curr_gold = starting_gold
var message_state = 0
@onready var game_over = false
@onready var main = load("res://scenes/gameplay_and_maps/main.tscn")
@onready var win_message = load("res://scenes/ui/message.tscn")
@onready var main_menu = load("res://scenes/ui/main_menu.tscn")

func _ready() -> void:
	$Box1.hide()
	$Box2.hide()
	$Label.hide()
	$Label2.hide()
	$Label3.hide()
	$Button.hide()
	var win = win_message.instantiate()
	add_child(win)
	win.set_message("Incoming Message... \n\n Welcome to BootCamp Fresh Meat  \n\n Press Next")
	
	
func _on_button_pressed() -> void:
	$tutorial_path/Timer.start() 
	$Button.queue_free()
	
	

func _physics_process(_delta: float) -> void:
	if game_over:
		tutorial_failed()
	if $tutorial_path.get_child_count() == 0:
		tutorial_won()
		set_physics_process(false)
		
		
func tutorial_won():
	var win = win_message.instantiate()
	add_child(win)
	win.set_message("Now you know how to defend earth... \n\ngood luck soldier")
	main_menu = main_menu.instantiate() #main.instantiate()
	await get_child(win.get_index()).get_child(2).timeout
	get_parent().add_child(main_menu)
	get_parent()._ready() # reconnect nodes in main
	queue_free()

func tutorial_failed():
		var loss_screen_scene = load("res://scenes/ui/loss_screen.tscn")
		var loss_screen = loss_screen_scene.instantiate()
		loss_screen.level_path = "res://scenes/gameplay_and_maps/tutorial.tscn"
		get_parent().add_child(loss_screen)
		queue_free()
		

# showing area of towers
func _input(event):
	if event is InputEventMouseButton and event.button_mask == 0:
		#print("click in game scene")
		var towers = $tower_container.get_children()
		# loop thorugh towers and decide if ui should be on or off
		for t in towers:
			var local_mouse_pos = t.to_local(event.global_position)
			var clicked_tower = shape_contains_point(t.get_node("character_collision_shape"), local_mouse_pos)
			if clicked_tower and not placing_active:
				t.tower_ui_on()
			elif clicked_ui(event.global_position):
				pass # don't change anything if ui is clicked
			else:
				t.tower_ui_off() # clicked off tower
			
# check if mouse click is in rectangle (uses local mouse position)
func shape_contains_point(collision_area, local_mouse_position):
	var extents = collision_area.shape.extents
	if abs(local_mouse_position.x) <= extents.x and abs(local_mouse_position.y) <= extents.y:
		return true
	else:
		return false

func clicked_ui(mouse_position):
	if mouse_position.x > 1280:
		return true
	return false
	


func _on_button_2_pressed() -> void:
	var win = win_message.instantiate()
	add_child(win)
	if message_state == 0:
		win.set_message("Drag Tower from Right Side and Place in Green Squares \n\n Press Next")
		message_state = 1  # Update the state to show the second message nex
	elif message_state == 1:
		win.set_message("Placing towers along the path turns it Red, Stopping you \n\n Press Next")
		message_state = 2 
	elif message_state == 2:
		win.set_message("Selecting towers Opnes the Ui Upgrade screen on the Right side \n\n Press Next ")
		message_state = 3
	elif message_state == 3:
		win.set_message("Upgrading Towers will increase range and Damage \n\n It will also change the color \n\n Press Next ")
		message_state = 4
	elif message_state == 4:
		win.set_message("You May Also Sell Towers for 75% back \n\n Press Next ")
		message_state = 5
	elif message_state == 5:
		win.set_message("More enemies Killed, gets you more Gold \n\n Press Next")
		message_state = 6  # Reset state if needed
	elif message_state == 6:
		win.set_message("This Message will Self Destruct in 3 Seconds \n\n Press Start Game when ready")
		$Next.queue_free()
		message_state = 0
		$Box1.show()
		$Box2.show()
		$Label.show()
		$Label2.show()
		$Label3.show()
		$Button.show()
		
