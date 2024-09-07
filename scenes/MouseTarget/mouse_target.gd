extends Node2D

@export var drag_coefficient = 5.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.position.x += event.relative.x * (1 / drag_coefficient)
		self.position.y += event.relative.y * ( 1 / drag_coefficient)
		
		
