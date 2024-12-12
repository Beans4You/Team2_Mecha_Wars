extends tower_shooting

var enemy_relative
var angle

func _ready():
	super._ready()


func shoot():
	var audio_node = AudioStreamPlayer2D.new()
	# Load the audio file 
	var audio_stream = preload("res://resources/sound/072807_heavy-machine-gun-50-caliber-39765.mp3") 
	audio_node.stream = audio_stream
	get_parent().get_parent().add_child(audio_node)
	audio_node.volume_db = -10
	audio_node.play() # Play the sound
	
	shoot_ready = false
	
	var enemy_position = current_enemy.get_parent().position
	enemy_relative = enemy_position - position
	angle = atan2(enemy_relative.y, enemy_relative.x)
	
	if color == 'red':
		$animated_sprite.animation = "shoot"
	if color == 'blue':
		$animated_sprite.animation = "shoot_blue"
	if color == 'purple':
		$animated_sprite.animation = "shoot_purple"
	if color == 'gold':
		$animated_sprite.animation = "shoot_gold"
	
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
		#$animated_sprite.play("idle")
		if color == "red":
			$animated_sprite.play("idle")
		elif color == "purple":
			$animated_sprite.play("idle_purple")
		elif color == "blue":
			$animated_sprite.play("idle_blue")
		elif color == "gold":
			$animated_sprite.play("idle_gold")
		else:
			print("color error")
	shoot_ready = true
