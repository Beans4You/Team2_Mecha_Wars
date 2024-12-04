extends enemy_script

@onready var runner_path = preload("res://scenes/enemies/runner/runner_path_level_3.tscn")
@onready var flyer_path = preload("res://scenes/enemies/flyer/flyer_path_level_3.tscn")
@onready var cthulhu_path = preload("res://scenes/enemies/cthulhu/cthulhu_path_level_3.tscn")
@onready var cur_scene = get_parent().get_parent().get_parent()
@onready var last_enemy_out = false

@export var max_health = 500
var timer = 1
var rng = RandomNumberGenerator.new()

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
		self.speed = 0
		$AnimatedSprite2D.play("base")
		$CollisionShape2D.disabled = true
		$spawn_timer.stop()
		
		$explosion1.play("expl")
		$explosion1.visible = true
		$explosion2.play("expl")
		$explosion2.visible = true
		$explosion3.play("expl")
		$explosion3.visible = true
		
		await get_tree().create_timer(3.0).timeout
		
		get_parent().get_parent().queue_free()
		get_parent().get_parent().get_parent().mothership_defeated = true
		game_scene.curr_gold += self.gold_worth


func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body


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


func _on_explosion_1_animation_looped() -> void:
	$explosion1.position.x = rng.randf_range(-25, 50)
	$explosion1.position.y = rng.randf_range(-25, 25)


func _on_explosion_2_animation_looped() -> void:
	$explosion2.position.x = rng.randf_range(75, 100)
	$explosion2.position.y = rng.randf_range(-50, 55)


func _on_explosion_3_animation_looped() -> void:
	$explosion3.position.x = rng.randf_range(150, 220)
	$explosion3.position.y = rng.randf_range(-40, 10)
