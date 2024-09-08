extends CPUParticles2D

@export var grate_component : GrateComponent

func emit() -> void:
	self.emitting = true

func _ready() -> void:
	grate_component.grate_start.connect(emit)
