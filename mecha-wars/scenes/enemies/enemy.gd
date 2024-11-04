extends CharacterBody2D
class_name enemy_script

@export var speed = 120

var health = 10
var attack_damage = 5

var gold_worth = 100

var at_stronghold = false
var stronghold
@onready var game_scene = get_parent().get_parent().get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


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
			
	#if game_scene.game_over == true:
		#get_tree().call_group("enemy", "queue_free")
		# to do: adjust game over function to encompass this
	
	
	if health <=0:
		get_parent().get_parent().queue_free()
		game_scene.curr_gold += self.gold_worth
		# to do: add gold to gold amount, likely need connection or from hit function


# hit scan (tower shooting scene)
func on_hit(damage):
	health -= damage
	$damaged_audio.play()
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
