extends Area2D

class_name GrabComponent

signal grab_start
signal grab_end

@export var parent : Node2D
var mouse_inside := false
var grabbed := false
var grabber : Area2D = null
var position_delta := Vector2(0,0)

func _ready() -> void:
	EventBus.done_grating.connect(removed)

func _input(event):
	if event is InputEventMouseButton and mouse_inside:
		if event.pressed:
			grabbed = true
			emit_signal("grab_start")
			position_delta = grabber.global_position - parent.global_position
	if event is InputEventMouseButton and grabbed:
		if not event.pressed:
			emit_signal("grab_end")
			grabbed = false

# Vi skal nok finde ud af at gøre dette 
func _process(_delta: float) -> void:
	if grabbed:
		parent.global_position = grabber.global_position - position_delta

func removed():
	emit_signal("grab_end")

func _on_area_exited(_area: Area2D) -> void:
	mouse_inside = false


func _on_area_entered(area: Area2D) -> void:
	mouse_inside = true
	grabber = area
