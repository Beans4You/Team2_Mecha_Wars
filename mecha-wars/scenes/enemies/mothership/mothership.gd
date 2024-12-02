extends enemy_script

@export var max_health = 500
var timer = 1

func _ready():
	$spawn_animation.hide()
	$AnimatedSprite2D.play('move')
	
	self.health = max_health
	
	$health_bar.max_value = max_health
	
	$spawn_timer.start()


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	
	if at_stronghold:
		if stronghold.visible:
			speed = 0
			$AnimatedSprite2D.play('attack')
		else:
			speed = 120
			$AnimatedSprite2D.play('move')
	
	
	if health <=0:
		get_parent().get_parent().queue_free()
		get_parent().get_parent().get_parent().mothership_defeated = true
		game_scene.curr_gold += self.gold_worth


func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body


@onready var runner_path = preload("res://scenes/enemies/runner/runner_path_level_3.tscn")
@onready var flyer_path = preload("res://scenes/enemies/flyer/flyer_path_level_3.tscn")
@onready var cthulhu_path = preload("res://scenes/enemies/cthulhu/cthulhu_path_level_3.tscn")
@onready var cur_scene = get_parent().get_parent().get_parent()
@onready var last_enemy_out = false

var rng = RandomNumberGenerator.new()


func _on_spawn_timer_timeout() -> void:
	var num = rng.randi_range(1, 100)
	if (num >= 40):
		var temp_path = runner_path.instantiate()
		cur_scene.add_child(temp_path)
		temp_path.get_child(0).progress_ratio = get_parent().progress_ratio
		temp_path.get_child(0).get_child(0).hide()
		$spawn_animation.show()
		$spawn_animation.set_global_position(temp_path.get_child(0).get_child(0).global_position)
		$spawn_animation.play("spawn")
		temp_path.get_child(0).get_child(0).show()
	elif (num < 40 && num > 5):
		var temp_path = flyer_path.instantiate()
		cur_scene.add_child(temp_path)
		temp_path.get_child(0).progress_ratio = get_parent().progress_ratio
		temp_path.get_child(0).get_child(0).hide()
		$spawn_animation.show()
		$spawn_animation.set_global_position(temp_path.get_child(0).get_child(0).global_position)
		$spawn_animation.play("spawn")
		temp_path.get_child(0).get_child(0).show()
	elif (num <= 5):
		var temp_path = cthulhu_path.instantiate()
		cur_scene.add_child(temp_path)
		temp_path.get_child(0).progress_ratio = get_parent().progress_ratio
		temp_path.get_child(0).get_child(0).hide()
		$spawn_animation.show()
		$spawn_animation.set_global_position(temp_path.get_child(0).get_child(0).global_position)
		$spawn_animation.play("spawn")
		temp_path.get_child(0).get_child(0).show()
	
	$spawn_timer.wait_time = 0.25 + (self.health / 500.0)


func _on_spawn_animation_animation_finished():
	$spawn_animation.hide()
