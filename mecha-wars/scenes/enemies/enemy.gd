extends CharacterBody2D
class_name enemy

@export var speed = 200
var health = 10
var damage = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play('move')
	$AnimatedSprite2D.flip_h = true


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		$AnimatedSprite2D.play('attack')
	
	
	if health <=0:
		get_parent().get_parent().queue_free()


# hit scan (tower shooting scene)
#func on_hit(damage):
	#health -= damage
	#if health <= 0:
		#get_parent().get_parent().queue_free()
