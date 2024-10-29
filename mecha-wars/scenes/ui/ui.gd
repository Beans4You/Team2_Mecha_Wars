extends CanvasLayer

@onready var game_scene = get_parent()
#var starting_gold = get_parent().starting_gold
#var curr_gold = get_parent().curr_gold
#var game_over = get_parent().game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	$GoldLabel.text = str("Gold: ", game_scene.starting_gold)

func _process(_delta):
	$GoldLabel.text = str("Gold: ",game_scene.curr_gold)
	#game_over = get_parent().game_over
	#if game_scene.game_over == true:
		#hide()
		#get_tree().call_group("towers", "queue_free")
