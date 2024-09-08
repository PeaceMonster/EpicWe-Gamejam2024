extends Area2D

class_name GrateComponent

signal grate_start
signal grate_stop

@export var parent : Node2D
@export var grate_hardness : = 10.0
@export var health : = 20.0
@export var particle_color : Color = Color.WHITE
var rng = RandomNumberGenerator.new()
var grating := false
var prev_pos := Vector2(0,0)



func grate(velocity: float, delta: float):
	if velocity * delta > grate_hardness / 100:
		health -= 0.1
		emit_signal("grate_start")
	
	if health <= 0:
		EventBus.done_grating_emit()
		emit_signal("grate_stop")
		parent.queue_free()



func _on_area_entered(_area: Area2D) -> void:
	grating = true
	

func _on_area_exited(_area: Area2D) -> void:
	grating = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('skip_item'):
		EventBus.done_grating_emit()
		parent.queue_free()
		

func _process(delta: float) -> void:
	if grating and not prev_pos == self.global_position:
		grate(abs(global_position.y - prev_pos.y), delta)
	prev_pos = self.global_position

	
