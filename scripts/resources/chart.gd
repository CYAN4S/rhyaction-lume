extends Resource
class_name Chart
## Chart contains the data list of notes, music metatdata, etc.

@export var track: Track

## List of notes.
@export var notes: Array[NoteData]


@export var bpm: BpmData