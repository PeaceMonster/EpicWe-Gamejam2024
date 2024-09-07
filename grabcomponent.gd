extends Area2D

@export var parent : Node2D
var mouse_inside := false
var grabbed := false
var grabber : Area2D = null
var position_delta := Vector2(0,0)


func _input(event):
	if event is InputEventMouseButton and mouse_inside:
		if event.pressed:
			grabbed = true
			position_delta = grabber.global_position - parent.global_position
			print(position_delta)
			print("Grab")
	if event is InputEventMouseButton and grabbed:
		if not event.pressed:
			grabbed = false
			print("Release")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if grabbed:
		parent.position = grabber.global_position - position_delta


func _on_area_exited(area: Area2D) -> void:
	mouse_inside = false


func _on_area_entered(area: Area2D) -> void:
	mouse_inside = true
	grabber = area
