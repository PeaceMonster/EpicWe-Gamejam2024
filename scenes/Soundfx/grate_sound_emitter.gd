extends AudioStreamPlayer

@export var grate_component: GrateComponent 

func _ready() -> void:
	grate_component.grate_start.connect(makesound)
	grate_component.grate_stop.connect(stop_sound)

func makesound() -> void:
	if not playing: 
		play()

func stop_sound() -> void:
	stop()
