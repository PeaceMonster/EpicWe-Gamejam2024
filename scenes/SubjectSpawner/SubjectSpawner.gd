extends Node2D

@export var subjects : Array[PackedScene]
@export var killhand : PackedScene

@onready var spawn_point: Marker2D = $SpawnPoint
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

var spawn_index: int = 0
var spawn_point_init: Vector2

func _ready() -> void:
	EventBus.done_grating.connect(delayed_spawn)
	spawn_point_init = spawn_point.position
	
	spawn_item(subjects[spawn_index])
	spawn_index += 1

func delayed_spawn():
	timer.start()

func spawn_item(item: PackedScene):
	var spawned = item.instantiate()
	spawn_point.add_child(spawned)
	animation_player.play("new_spawn")

func spawn_next():
	spawn_point.position = spawn_point_init
	if spawn_index < len(subjects):
		spawn_item(subjects[spawn_index])
		spawn_index += 1
	elif spawn_index == len(subjects):
		spawn_index += 1
		var hand = get_tree().get_first_node_in_group("hand")
		var killhand_inst = killhand.instantiate()
		hand.add_child(killhand_inst)
		killhand_inst.find_child("gratecomponent").parent = hand
		animation_player.play("new_spawn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
