extends tower
class_name tower_shooting

var enemy_array = []
var enemy
var shoot_ready = true
var damage = 1
var rate_of_fire = 0.1


func _physics_process(_delta):
	if enemy_array.size() != 0:
		select_enemy()
		if shoot_ready:
			shoot()
	else:
		enemy = null

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
	enemy = enemy_array[enemy_index]
		

func shoot():
	shoot_ready = false
	enemy.on_hit(damage)
	await(get_tree().create_timer(rate_of_fire).timeout)
	shoot_ready = true
	
