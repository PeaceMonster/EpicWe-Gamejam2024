extends Node2D

@export var drag_coefficient = 5.0

@onready var visual_arm_2 = $"../VisualArm2"
@export var max_distance: float = 440
var base_point: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_point = visual_arm_2.get_base_point()
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.position.x += event.relative.x * (1 / drag_coefficient)
		self.position.y += event.relative.y * ( 1 / drag_coefficient)
		clamp_own_position()
		

func clamp_own_position() -> void:
	var offset: Vector2 = self.global_position - base_point
	var noffset: Vector2 = offset.normalized()
	self.position = base_point + noffset * max_distance * min(
		(offset.length() / max_distance),
		1
	)
	
	
	pass
