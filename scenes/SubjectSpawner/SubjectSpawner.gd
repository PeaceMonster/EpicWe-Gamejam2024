extends Node2D

@export var subjects : Array[PackedScene]

@onready var spawn_point: Marker2D = $SpawnPoint
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var spawn_index: int = 0
var spawn_point_init: Vector2

func _ready() -> void:
	EventBus.done_grating.connect(spawn_next)
	spawn_point_init = spawn_point.position
	
	spawn_item(subjects[spawn_index])
	spawn_index += 1

func spawn_item(item: PackedScene):
	var spawned = item.instantiate()
	spawn_point.add_child(spawned)
	animation_player.play("new_spawn")

func spawn_next():
	spawn_point.position = spawn_point_init
	if spawn_index < len(subjects):
		spawn_item(subjects[spawn_index])
		spawn_index += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
