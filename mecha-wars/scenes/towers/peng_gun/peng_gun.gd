extends tower_shooting

var enemy_relative
var angle

func _ready():
	super._ready()


func shoot():
	shoot_ready = false
	
	var enemy_position = current_enemy.get_parent().position
	enemy_relative = enemy_position - position
	angle = atan2(enemy_relative.y, enemy_relative.x)
	
	$animated_sprite.animation = "shoot"
	if angle < 0:
		angle += 2*PI
	if angle < PI/3:
		$animated_sprite.frame = 5
		$aim.rotation_degrees = 118
		$aim/AnimatedSprite2D.position.y = -60
	elif angle < 2*PI/3:
		$animated_sprite.frame = 4
		$aim.rotation_degrees = 180
		$aim/AnimatedSprite2D.position.y = -43
	elif angle < 3*PI/3:
		$animated_sprite.frame = 3
		$aim.rotation_degrees = -118
		$aim/AnimatedSprite2D.position.y = -60
	elif angle < 4*PI/3:
		$animated_sprite.frame = 2
		$aim.rotation_degrees = -58
		$aim/AnimatedSprite2D.position.y = -57
	elif angle < 5*PI/3:
		$animated_sprite.frame = 1
		$aim.rotation_degrees = 0
		$aim/AnimatedSprite2D.position.y = -43
	else:
		$animated_sprite.frame = 0
		$aim.rotation_degrees = 60
		$aim/AnimatedSprite2D.position.y = -57
	$aim/AnimatedSprite2D.play()
	
	
	current_enemy.on_hit(damage)
	if !enemy_array.is_empty():
		#print(enemy.health)
		current_enemy.get_child(-1).play('turret_hit')
	await(get_tree().create_timer(rate_of_fire).timeout)
	if enemy_array.is_empty():
		$animated_sprite.play("idle")
	shoot_ready = true
