extends CharacterBody2D
class_name enemy

@export var speed = 200
var health = 10
var attack_damage = 5

var at_stronghold = false
var stronghold

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play('move')
	$AnimatedSprite2D.flip_h = true


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	
	if at_stronghold:
		if stronghold.visible:
			speed = 0
			$AnimatedSprite2D.play('attack')
		else:
			speed = 200
			$AnimatedSprite2D.play('move')
	
	
	if health <=0:
		get_parent().get_parent().queue_free()


# hit scan (tower shooting scene)
func on_hit(damage):
	health -= damage
	#if health <= 0:
		#get_parent().get_parent().queue_free()


#checking to see if enemy is at the stronghold
func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body

#when attack animation loops, do damage to the stronghold
func _on_animated_sprite_2d_animation_looped() -> void:
	if $AnimatedSprite2D.animation == 'attack':
		stronghold.take_damage(attack_damage)
