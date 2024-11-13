extends tower_shooting

var enemy_relative

func _ready():
	tower_range = 1500
	gold_cost = 200

	super._ready()

func shoot():
	shoot_ready = false
	
	enemy_relative = enemy.position - position
	$animated_sprite.animation = "shoot"
	if enemy_relative.y / enemy_relative.x > 1.33:
		if enemy_relative.y < 0:
			$animated_sprite.frame = 1
		else:
			$animated_sprite.frame = 4
	elif enemy_relative.y / enemy_relative.x < -1.33:
		if enemy_relative.y < 0:
			$animated_sprite.frame = 5
		else:
			$animated_sprite.frame = 2
	else:
		if enemy_relative.y > 0:
			$animated_sprite.frame = 3
		else:
			$animated_sprite.frame = 0
	
	enemy.on_hit(damage)
	if !enemy_array.is_empty():
		#print(enemy.health)
		enemy.get_child(-1).play('turret_hit')
	await(get_tree().create_timer(rate_of_fire).timeout)
	if enemy_array.is_empty():
		$animated_sprite.play("idle")
	shoot_ready = true
