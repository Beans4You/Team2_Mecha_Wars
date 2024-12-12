extends enemy_script

@export var max_health = 100#200
var phase = 1
var path
var cur_x
var last_x = 0


func _ready():
	$AnimatedSprite2D.play('move')
	path = get_parent().get_parent()
	
	self.health = max_health

	$health_bar.max_value = max_health


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	
	cur_x = round(global_position.x)
	if (cur_x < last_x):
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	last_x = cur_x
	
	
	if at_stronghold and alive:
		if stronghold.visible:
			speed = 0
			$AnimatedSprite2D.play('attack')
		else:
			speed = self.speed
			$AnimatedSprite2D.play('move')
	
	if (float(self.health) <= float(max_health) / 2.0 and phase == 1):
		phase = 2
		transform()
	
	if health <= 0 and alive:
		alive = false
		game_scene.curr_gold += self.gold_worth
		$CollisionShape2D.disabled = true
		$hit_area/CollisionShape2D.disabled = true
		$AnimatedSprite2D.play("death")
		self.speed = 0
		await $AnimatedSprite2D.animation_finished
		
		get_parent().get_parent().queue_free()


func transform():
	self.speed = 0
	$CollisionShape2D.disabled = true
	$AnimatedSprite2D.play("transform")
	await get_tree().create_timer(3.5).timeout
	#print(get_tree())
	# await create_timer(3.5).timeout
	$AnimatedSprite2D.play("flying")
	self.speed = 120
	self.health = max_health
	$CollisionShape2D.disabled = false


func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body



func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.frame == 3 and $AnimatedSprite2D.animation == 'attack':
		stronghold.take_damage(attack_damage)
