extends tower_shooting


var enemy_relative


func _ready():
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
			pass
			#$animated_sprite.play('idle')
		current_enemy = null
		

func shoot():
	var audio_node = AudioStreamPlayer2D.new()
	# Load the audio file 
	var audio_stream = preload("res://resources/sound/submachine-gun-79846.mp3") 
	audio_node.stream = audio_stream
	get_parent().get_parent().add_child(audio_node)
	audio_node.volume_db = -30
	audio_node.play() # Play the sound
	
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
		#current_enemy.get_child(-1).play('turret_hit')
	await(get_tree().create_timer(rate_of_fire).timeout)
	if enemy_array.is_empty():
		#$animated_sprite.play("idle")
		pass
	shoot_ready = true
