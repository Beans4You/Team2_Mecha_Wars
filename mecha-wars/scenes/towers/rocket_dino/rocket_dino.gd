extends tower_projectile

var enemy_relative

func _ready():
	super._ready()
	
	

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

		$dino_arm.look_at(enemy_position)
		$dino_arm.rotation -= deg_to_rad(10)
		if shoot_ready:
			shoot()
	else:
		if !$animated_sprite.is_playing():
			$animated_sprite.play('idle')
		current_enemy = null

func _on_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_array.append(body)
