extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$GoldLabel.text = str("Gold: ", global_vars.starting_gold)

func _process(_delta):
	$GoldLabel.text = str("Gold: ", global_vars.curr_gold)
	
	if global_vars.game_over == true:
		hide()
		get_tree().call_group("towers", "queue_free")
