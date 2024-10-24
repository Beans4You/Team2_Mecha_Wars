extends CharacterBody2D
var target 
var speed = 500
var bullet_damage = 5
var explosion = preload("res://scenes/towers/rocket_dino/explosion.tscn")

func set_target(target_in):
	target = target_in



func _physics_process(delta: float) -> void:
	if target == null:
		#print("null")
		position += speed * Vector2.RIGHT.rotated(rotation) * delta
		#position += Vector2(1,1) * speed * delta
		return
	look_at(target.global_position)
	position = position.move_toward(target.global_position, speed * delta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.health -= bullet_damage
		var expl = explosion.instantiate()
		add_sibling(expl)
		expl.position = position
		queue_free()
		

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#print("screen exit")
	queue_free()
	
