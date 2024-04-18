extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_game_manager_combo_added(combo: int) -> void:
	text = str(combo)
	pass # Replace with function body.



func _on_game_manager_combo_breaked() -> void:
	text = ""
	pass # Replace with function body.
