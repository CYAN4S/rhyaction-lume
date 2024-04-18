extends Node2D
class_name Note

@export var time := 0.0
@export var line := 0


func _ready() -> void:
	position.x = line * 120 - 180


func _process(_delta: float) -> void:
	position.y = (Global.get_time() - time) * 100 * Global.scroll_speed
