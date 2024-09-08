extends Node2D

@export var drag_coefficient = 5.0

@onready var visual_arm_2 = $"../VisualArm2"
var max_reach: float
var reach_base: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reach_base = visual_arm_2.get_base_point()
	max_reach = visual_arm_2.get_reach() * visual_arm_2.global_scale.x
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.position.x += event.relative.x * (1 / drag_coefficient)
		self.position.y += event.relative.y * ( 1 / drag_coefficient)
		clamp_own_position()
		

func clamp_own_position() -> void:
	var offset: Vector2 = self.global_position - reach_base
	var noffset: Vector2 = offset.normalized()
	self.position = reach_base + noffset * max_reach * min(
		(offset.length() / max_reach),
		1
	)
