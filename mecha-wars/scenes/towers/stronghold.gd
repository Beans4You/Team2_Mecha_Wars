extends StaticBody2D

const max_health = 100
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_vars.connect("restart_game", start_game)
	start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if health < 0:
		visible = false
		global_vars.game_over = true

func start_game():
	health = max_health
	visible = true
	
	$ProgressBar.value = max_health


func take_damage(damage):
	health -= damage
	$ProgressBar.value = health
	
