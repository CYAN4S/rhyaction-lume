extends Node
# This node is in autoload(Singleton)

@export var current_time := -5.0
@export var current_beat := -10.0
@export var scroll_speed := 4.5

@export var time: float:
	get: 
		return (Time.get_ticks_usec() - _start_time) / 1000000.0 - 5.0

@export var beat: float:
	get:
		return time / 60.0 * _cached_bpm;
		

var _start_time := 0
var _cached_bpm := 120.0

func store_bpm(bpm: float) -> void:
	_cached_bpm = bpm

func start_timer() -> void:
	_start_time = Time.get_ticks_usec()
