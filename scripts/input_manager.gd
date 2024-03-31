class_name InputManager
extends Node

signal gameplay_key_pressed(key: int)
signal gameplay_key_released(key: int)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("gameplay_4b_0"):
		gameplay_key_pressed.emit(0)
	if event.is_action_pressed("gameplay_4b_1"):
		gameplay_key_pressed.emit(1)
	if event.is_action_pressed("gameplay_4b_2"):
		gameplay_key_pressed.emit(2)
	if event.is_action_pressed("gameplay_4b_3"):
		gameplay_key_pressed.emit(3)
	if event.is_action_released("gameplay_4b_0"):
		gameplay_key_released.emit(0)
	if event.is_action_released("gameplay_4b_1"):
		gameplay_key_released.emit(1)
	if event.is_action_released("gameplay_4b_2"):
		gameplay_key_released.emit(2)
	if event.is_action_released("gameplay_4b_3"):
		gameplay_key_released.emit(3)
