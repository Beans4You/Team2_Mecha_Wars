extends CharacterBody2D

class_name tower

var tower_range = 400
var gold_cost = 300
var upgrade_ui = load("res://scenes/ui/upgrade_ui.tscn")
var current_enemy
var enemy_array = []
var targeting_mode = "first"

func _ready():
	$area.size = Vector2(tower_range, tower_range)
	$area.position = -1 * Vector2(tower_range, tower_range) / 2
	$range/range_collision_shape.shape.radius = float(tower_range) / 2
	#$range.position = -1 * Vector2(tower_range, tower_range) / 2
	$animated_sprite.play("idle")
	$area.mouse_filter = Control.MOUSE_FILTER_IGNORE # makes area node unclickable for handling clicking input
		
func select_enemy():
	if targeting_mode == "first":
		first_select_enemy()
	elif targeting_mode == "strong":
		strong_select_enemy()
	elif targeting_mode == "last":
		last_select_enemy()
	else:
		print("targeting error")

func first_select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.get_parent().get_progress())
	var max_progress = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_progress)
	current_enemy = enemy_array[enemy_index]

func strong_select_enemy():
	var max_strength_array = []
	for e in enemy_array:
		max_strength_array.append(e.health)
	var max_strength = max_strength_array.max()
	var enemy_index = max_strength_array.find(max_strength)
	current_enemy = enemy_array[enemy_index]

func last_select_enemy():
	var min_strength_array = []
	for e in enemy_array:
		min_strength_array.append(e.health)
	var min_strength = min_strength_array.min()
	var enemy_index = min_strength_array.find(min_strength)
	current_enemy = enemy_array[enemy_index]

func tower_ui_off():
	$area.visible = false
	if has_node("upgrade_ui"):
		get_node("upgrade_ui").queue_free()

func tower_ui_on():
	$area.visible = true
	if not has_node("upgrade_ui"):
		add_child(upgrade_ui.instantiate())
