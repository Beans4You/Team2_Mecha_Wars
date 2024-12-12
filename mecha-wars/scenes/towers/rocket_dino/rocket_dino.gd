extends tower_projectile

var enemy_relative


func _ready():
	#$dino_arm.play("default")
	$animated_sprite.play("idle")
	$area.size = Vector2(tower_range, tower_range)
	$area.position = -1 * Vector2(tower_range, tower_range) / 2
	$range/range_collision_shape.shape.radius = float(tower_range) / 2
	#$range.position = -1 * Vector2(tower_range, tower_range) / 2
	#$animated_sprite.play("idle")
	$area.mouse_filter = Control.MOUSE_FILTER_IGNORE # makes area node unclickable for handling clicking input
	rate_of_fire = 1.5
	gold_cost = 250

func create_bullet(target_in):
	var target = target_in
	var bullet = bullet_scene.instantiate()
	bullet.set_target(target)
	bullet.bullet_damage = damage
	bullet.global_position = $dino_arm/aim.global_position
	get_tree().root.add_child(bullet)

func _physics_process(_delta):
	if enemy_array.size() != 0:
		select_enemy()
		var enemy_position = current_enemy.get_parent().global_position
		enemy_relative = enemy_position - position
		if color == "red":
			$animated_sprite.play("shoot")
			$dino_arm.play("shoot_red")
		elif color == "purple":
			$animated_sprite.play("shoot_purple")
			$dino_arm.play("shoot_purple")
		elif color == "blue":
			$animated_sprite.play("shoot_blue")
			$dino_arm.play("shoot_blue")
		elif color == "gold":
			$animated_sprite.play("shoot_gold")
			$dino_arm.play("shoot_gold")
		else:
			print("color error")
		
		$dino_arm.look_at(enemy_position)
		$dino_arm.rotation -= deg_to_rad(15)
		if shoot_ready:
			shoot()
	else:
		if color == "red":
			$animated_sprite.play("idle")
			$dino_arm.play("idle_red")
		elif color == "purple":
			$animated_sprite.play("idle_purple")
			$dino_arm.play("idle_purple")
		elif color == "blue":
			$animated_sprite.play("idle_blue")
			$dino_arm.play("idle_blue")
		elif color == "gold":
			$animated_sprite.play("idle_gold")
			$dino_arm.play("idle_gold")
		else:
			print("color error")
			
			
		$dino_arm.rotation = 0
		current_enemy = null

func _on_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_array.append(body)

func shoot():
	var audio_node = AudioStreamPlayer2D.new()
	# Load the audio file 
	var audio_stream = preload("res://resources/sound/medium-explosion-40472.mp3") 
	audio_node.stream = audio_stream
	get_parent().get_parent().add_child(audio_node)
	audio_node.volume_db = -9
	audio_node.play() # Play the sound
	
	#$animated_sprite.play('shoot')
	shoot_ready = false
	#print("shoot")
	create_bullet(current_enemy)
	await(get_tree().create_timer(rate_of_fire).timeout)
	#create_bullet(current_enemy)
	#$animated_sprite.play('idle')
	shoot_ready = true
	
	
