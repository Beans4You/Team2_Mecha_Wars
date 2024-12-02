extends tower_shooting


var enemy_relative
var angle

func _ready():
	gold_cost = 200
	damage = 0.5
	rate_of_fire = 0.2
	tower_range = 500
	super._ready()

func _physics_process(_delta: float) -> void:
	if enemy_array.size() != 0:
		select_enemy()
		var enemy_position = current_enemy.get_parent().global_position
		enemy_relative = enemy_position - position

		$barrel.look_at(enemy_position)
		$barrel.rotation += deg_to_rad(90)
		
		if shoot_ready:
			shoot()
	else:
		if !$animated_sprite.is_playing():
			$animated_sprite.play('idle')
		current_enemy = null
		

func shoot():
	shoot_ready = false
	#
	#var enemy_position = current_enemy.get_parent().position
	#enemy_relative = enemy_position - position
	#angle = atan2(enemy_relative.y, enemy_relative.x)
	
	$animated_sprite.animation = "shoot"
	
	
	
	current_enemy.on_hit(damage)
	if !enemy_array.is_empty():
		$barrel/aim/AnimatedSprite2D.play()
		#print(enemy.health)
		current_enemy.get_child(-1).play('turret_hit')
	await(get_tree().create_timer(rate_of_fire).timeout)
	if enemy_array.is_empty():
		$animated_sprite.play("idle")
	shoot_ready = true
