extends Node2D

@export var subjects : Array[PackedScene]
var index := 0
@onready var spawn_point: Marker2D = $SpawnPoint
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var spawn_point_init := Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.done_grating.connect(spawn_next)
	
	spawn_point_init = spawn_point.position
	var next_object = subjects[index].instantiate()
	spawn_point.add_child(next_object)
	animation_player.play("new_spawn")
	index += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn_next():
	spawn_point.position = spawn_point_init
	if index < len(subjects):
		var next_object = subjects[index].instantiate()
		spawn_point.add_child(next_object)
		animation_player.play("new_spawn")
		index += 1
