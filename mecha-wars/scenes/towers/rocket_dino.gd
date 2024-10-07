extends tower_shooting


var Bullet = preload("res://scenes/towers/dino_bullet.tscn")
var bulletDamage = 5
var pathName
var currTargets = []
var curr = null


func _on_range_body_entered(body: Node2D) -> void:
	if "runner" in body.name:
		var tempArray = []
		currTargets = get_node("range").get_overlapping_bodies()
		
		for i in currTargets:
			if "runner" in i.name:
					tempArray.append(i)
		
		var currTarget = null
				
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
					
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		get_node("bullet_container").call_deferred("add_child", tempBullet)
		tempBullet.global_position = $aim.global_position


func _on_range_body_exited(body: Node2D) -> void:
	currTargets = get_node("range").get_overlapping_bodies()
