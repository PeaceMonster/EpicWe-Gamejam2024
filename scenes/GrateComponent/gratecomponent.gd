extends Area2D

signal grate_done



@export var parent : Node2D
@export var grate_hardness : = 10.0
@export var health : = 20
@onready var particles : = $CPUParticles2D
@export var particle_color : Color = Color.WHITE
var rng = RandomNumberGenerator.new()
var grating := false
var prev_pos := Vector2(0,0)

func _ready() -> void:
	particles.color = particle_color

func grate(delta: float):
	if rng.randf() < (1 / grate_hardness):
		health -= delta
		particles.emitting = true
	
	if health <= 0:
		EventBus.done_grating_emit()
		parent.queue_free()



func _on_area_entered(area: Area2D) -> void:
	grating = true
	

func _on_area_exited(area: Area2D) -> void:
	grating = false


func _process(delta: float) -> void:
	if grating and not prev_pos == self.global_position:
		grate(delta)
	prev_pos = self.global_position

	
