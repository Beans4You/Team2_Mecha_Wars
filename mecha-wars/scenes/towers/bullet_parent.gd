extends CharacterBody2D

class_name bullet_parent

var target 
var speed = 500
var bullet_damage = 5
var explosion = preload("res://scenes/towers/rocket_dino/explosion.tscn")

func set_target(target_in):
	target = target_in



func _physics_process(delta: float) -> void:
	if target == null:
		#print("null")
		#position += speed * Vector2.RIGHT.rotated(rotation) * delta
		#position += speed * Vector2.RIGHT.rotated(rotation) * delta
		#position += Vector2(1,1) * speed * delta
		#print("null")
		return
	elif target.get_child(1).disabled:
		target = null
		#print("targeted is null now")
		return
	look_at(target.global_position)
	position = position.move_toward(target.global_position, speed * delta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	#print(body)
	if body.is_in_group("enemy"):
		body.health -= bullet_damage
		body.get_child(-1).play('turret_hit') # hit marker
		#print(body)
		#$damage_audio.play() # damage audio
		body.get_child(-2).play()
		if explosion != null:
			var expl = explosion.instantiate()
			add_sibling(expl)
			expl.position = position
		queue_free()
		

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#print("screen exit")
	queue_free()
	
