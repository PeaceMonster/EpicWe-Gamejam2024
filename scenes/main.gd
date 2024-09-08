extends Node2D

@onready var pot: AnimatedSprite2D = $Props/Pot

@onready var score_label: Label = $ScoreLabel
var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pot.play()
	EventBus.done_grating.connect(improve_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func improve_score(amount: int = 100) -> void:
	score += amount
	score_label.text = str(score)
	$ScoreLabel/AudioStreamPlayer2D.play()
