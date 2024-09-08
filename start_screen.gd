extends Node2D

@export var game : PackedScene
@onready var font: Sprite2D = $Font

var started = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not started:
		var game_inst = game.instantiate()
		self.add_child(game_inst)
		started = true
		
		
