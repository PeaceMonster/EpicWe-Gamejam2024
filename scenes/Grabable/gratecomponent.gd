extends Area2D

signal grate_done

@export var parent : Node2D
@export var grate_hardness : = 10.0
@export var health : = 20
var rng = RandomNumberGenerator.new()
var grating := false


func grate():
	if rng.randf() < (1.0 / grate_hardness):
		health -= 1
	
	if health <= 0:
		parent.queue_free()
		emit_signal("grate_done")
		


func _on_area_entered(area: Area2D) -> void:
	grating = true
	

func _on_area_exited(area: Area2D) -> void:
	grating = false

func _process(delta: float) -> void:
	if grating:
		grate()
