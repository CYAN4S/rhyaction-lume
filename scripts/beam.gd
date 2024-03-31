class_name Beam
extends Sprite2D


@export var line: int

@onready var input_manager: InputManager = $"../../InputManager"


func _ready() -> void:
	visible = false
	input_manager.gameplay_key_pressed.connect(_activate)
	input_manager.gameplay_key_released.connect(_deactivate)


func _exit_tree() -> void:
	if (input_manager.gameplay_key_pressed.is_connected(_activate)):
		input_manager.gameplay_key_pressed.disconnect(_activate)
	if (input_manager.gameplay_key_pressed.is_connected(_deactivate)):
		input_manager.gameplay_key_pressed.disconnect(_deactivate)


func _activate(key: int) -> void:
	if (key == line):
		visible = true


func _deactivate(key: int) -> void:
	if (key == line):
		visible = false
