extends tower
class_name tower_shooting

var enemy_array = []
var enemy
var shoot_ready = true
@export var damage = 1
@export var rate_of_fire = 0.1


func _physics_process(_delta):
	if enemy_array.size() != 0:
		select_enemy()
		if shoot_ready:
			shoot()
	else:
		if !$animated_sprite.is_playing():
			$animated_sprite.play('idle')
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
	$animated_sprite.play('shoot')
	shoot_ready = false
	enemy.on_hit(damage)
	if !enemy_array.is_empty():
		#print(enemy.health)
		enemy.get_child(-1).play('turret_hit')
	await(get_tree().create_timer(rate_of_fire).timeout)
	shoot_ready = true
	
