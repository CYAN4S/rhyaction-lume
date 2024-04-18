class_name GameManager
extends Node

@export var chart: Chart
@export var note_parent: Node2D
@export var combo: int

@export var score_state: int:
	set(value):
		score_state = value
		score_changed.emit(value)

signal score_changed(score: int)
signal combo_added(combo: int)
signal combo_breaked()


# Type this when nested types are supported
var note_container: Array[Array] # Array[Array[Note]]
var note_scene := load("res://scenes/note.tscn")


# Lifecycle

func _ready() -> void:
	_make_notes()
	Global.start_timer()


func _process(_delta: float):
	# Check missed notes
	for note_line: Array[Note] in note_container:
		if note_line.is_empty():
			continue
		
		if note_line[0].time - Global.get_time() < -0.2:
			print("MISS")
			note_line[0].queue_free()
			note_line.pop_front()
			_break_combo()


# Internal

func _make_notes() -> void:
	for i in range(4):
		print(i)
		note_container.append([])
	
	for i in chart.notes:
		_make_note(i)
		
	for note_line: Array[Note] in note_container:
		print(note_line)
		note_line.sort_custom(_sort_note_by_time)


func _make_note(i: NoteData) -> void:
	var instance: Note = note_scene.instantiate()
	
	instance.line = i.line
	instance.time = i.beat
	
	note_parent.add_child(instance)
	
	note_container[i.line].append(instance)


func _sort_note_by_time(a: Note, b: Note) -> bool:
	return a.time < b.time


func _add_combo() -> void:
	combo += 1
	combo_added.emit(combo)


func _break_combo() -> void:
	combo = 0
	combo_breaked.emit()


# Receiver

func _on_key_pressed(key: int) -> void:
	if (note_container[key].size() == 0):
		return
	
	var target: Note = note_container[key][0]
	var delta: float = target.time - Global.get_time()
	print(delta)
	
	if (delta >= 0.2):
		print("Ignored")
		return
	if (delta >= 0.04):
		score_state += 10
		print("RUSH")
	elif (delta >= -0.04):
		score_state += 50
		print("GOOD")
	elif (delta >= -0.2):
		score_state += 10
		print("DRAG")
	else:
		return

	note_container[key].pop_front()
	target.queue_free()
	_add_combo()


func _on_key_released(key: int) -> void:
	pass # Replace with function body.
