extends CharacterBody2D
class_name enemy_script

@export var speed = 120
@export var health = 10
@export var attack_damage = 5
@export var gold_worth = 100

var alive = true
var at_stronghold = false
var x_last = 0
var stronghold
@onready var game_scene = get_parent().get_parent().get_parent().get_parent()


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	
	if at_stronghold:
		if stronghold.visible:
			speed = 0
			$AnimatedSprite2D.play('attack')
		else:
			speed = 120
			$AnimatedSprite2D.play('move')
	
	var x_cur = global_position.x
	if health <= 0 and alive:
		var need_flip = false
		if (x_cur < x_last):
			need_flip = true
		death_func(need_flip)
		$damage_indicator.hide()
	x_last = x_cur


# hit scan (tower shooting scene)
func on_hit(damage):
	health -= damage
	#$damaged_audio.play()
	# TODO is this needed


func death_func(y_flip = false):
	alive = false
	game_scene.curr_gold += self.gold_worth
	$CollisionShape2D.disabled = true
	$hit_area/CollisionShape2D.disabled = true
	$AnimatedSprite2D.play("death")
	get_parent().rotates = true
	if y_flip:
		$AnimatedSprite2D.flip_v = true
	self.speed = 0
	await $AnimatedSprite2D.animation_finished
	
	get_parent().get_parent().queue_free()


#checking to see if enemy is at the stronghold
func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body


#when attack animation loops, do damage to the stronghold
func _on_animated_sprite_2d_animation_looped() -> void:
	if $AnimatedSprite2D.animation == 'attack':
		stronghold.take_damage(attack_damage)
