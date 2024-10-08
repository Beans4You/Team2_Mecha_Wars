extends tower

class_name tower_projectile


var bullet_scene = preload("res://scenes/towers/dino_bullet.tscn")

var enemy_array = []
var current_enemy
var shoot_ready = true
var damage = 5
var rate_of_fire = 1

func _physics_process(_delta):
	if enemy_array.size() != 0:
		select_enemy()
		if shoot_ready:
			shoot()
	else:
		current_enemy = null

func _on_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_array.append(body)


	

func _on_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_array.erase(body)

	

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.get_parent().get_progress())
	var max_progress = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_progress)
	current_enemy = enemy_array[enemy_index]
		

func shoot():
	shoot_ready = false
	#print("shoot")
	create_bullet(current_enemy)
	await(get_tree().create_timer(rate_of_fire).timeout)
	shoot_ready = true

func create_bullet(target_in):
	var target = target_in
	var bullet = bullet_scene.instantiate()
	bullet.set_target(target)
	bullet.global_position = $aim.global_position
	get_tree().root.add_child(bullet)