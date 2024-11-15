extends tower
class_name tower_shooting

#var enemy_array = []
#var current_enemy
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
		current_enemy = null

func _on_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_array.append(body)


func _on_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_array.erase(body)


func shoot():
	$animated_sprite.play('shoot')
	shoot_ready = false
	current_enemy.on_hit(damage)
	if !enemy_array.is_empty():
		#print(enemy.health)
		current_enemy.get_child(-1).play('turret_hit')
	await(get_tree().create_timer(rate_of_fire).timeout)
	shoot_ready = true
	
