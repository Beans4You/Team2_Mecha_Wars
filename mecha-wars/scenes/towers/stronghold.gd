extends StaticBody2D

const max_health = 100
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if health < 0:
		visible = false

func take_damage(damage):
	health -= damage
	$ProgressBar.value = health
