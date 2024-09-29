extends CharacterBody2D

@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.flip_h = true
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	pass
	#queue_free()
