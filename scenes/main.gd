extends Node2D

@export var subjects : Array[PackedScene]
var index := 0
@onready var spawn_point: Marker2D = $SpawnPoint


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_next():
	if index < len(subjects):
		pass
