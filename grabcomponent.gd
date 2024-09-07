extends Area2D

@export var parent : Node2D
var mouse_inside := false
var grabbed := false
var position_delta := Vector2(100,0)

func _mouse_enter() -> void:
	mouse_inside = true

func _mouse_exit() -> void:
	mouse_inside = false

func _input(event):
	if event is InputEventMouseButton and mouse_inside:
		if event.pressed:
			grabbed = true
			position_delta = get_viewport().get_mouse_position() - parent.position
			print("Grab")
	if event is InputEventMouseButton and grabbed:
		if not event.pressed:
			grabbed = false
			print("Release")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if grabbed:
		parent.position = get_viewport().get_mouse_position() - position_delta
