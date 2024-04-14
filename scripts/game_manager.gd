class_name GameManager
extends Node
## This is game manager.

@export var chart: Chart
@export var note_parent: Node2D

@export var score: int:
	set(value):
		score = value
		score_changed.emit(value)

signal score_changed(score: int)
signal combo_added(combo: int)
signal combo_breaked()


# Type this when nested types are supported
var note_container: Array[Array] # Array[Array[Note]]

var note_scene := load("res://scenes/note.tscn")


func _ready() -> void:
	make_notes()
	Global.start_timer()


func make_notes() -> void:
	for i in range(4):
		print(i)
		note_container.append([])
	
	for i in chart.notes:
		make_note(i)
		
	for note_line: Array in note_container:
		print(note_line)
		note_line.sort_custom(_sort_note_by_time)


func make_note(i: NoteData) -> void:
	var instance: Note = note_scene.instantiate()
	
	instance.line = i.line
	instance.time = i.beat
	
	note_parent.add_child(instance)
	
	note_container[i.line].append(instance)


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
		score += 10
		print("RUSH")
	elif (delta >= -0.04):
		score += 50
		print("GOOD")
	elif (delta >= -0.2):
		score += 10
		print("DRAG")
	else:
		print("MISS")

	note_container[key].pop_front()
	target.queue_free()

func _on_key_released(key: int) -> void:
	pass # Replace with function body.


func _sort_note_by_time(a: Note, b: Note) -> bool:
	return a.time < b.time
