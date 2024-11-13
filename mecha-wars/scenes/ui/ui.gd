extends CanvasLayer

@onready var game_scene = get_parent()

func _ready():
	$GoldLabel.text = str("Gold: ", game_scene.starting_gold)

func _process(_delta):
	$GoldLabel.text = str("Gold: ",game_scene.curr_gold)
