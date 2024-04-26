extends Node

@export var current_time := -5.0
@export var scroll_speed := 4.5

@export var time: float:
	get: 
		return (Time.get_ticks_usec() - _start_time) / 1000000.0 - 5.0
		

var _start_time := 0

func start_timer():
	_start_time = Time.get_ticks_usec()
