extends Node2D

@onready var pot: AnimatedSprite2D = $Pot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pot.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
