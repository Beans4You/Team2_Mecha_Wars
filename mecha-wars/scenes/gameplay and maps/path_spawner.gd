extends Node2D


@onready var runner_path = preload("res://scenes/enemies/runner_path.tscn")
@onready var flyer_path = preload("res://scenes/enemies/flyer_path.tscn")
@onready var game_scene = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	#pass # Replace with function body.


func _process(_delta):
	if game_scene.game_over == true:
		$timer.stop()


func _on_timer_timeout() -> void:
	var rng = RandomNumberGenerator.new()
	var rnum = rng.randi_range(1, 2)
	
	if rnum == 1:
		var temp_path = runner_path.instantiate()
		add_child(temp_path)
	elif rnum == 2:
		var temp_path = flyer_path.instantiate()
		add_child(temp_path)
