extends Node2D

var score: int = 0

@onready var pot = $Props/Pot
@onready var score_label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pot.play()
	EventBus.done_grating.connect(improve_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func improve_score(amount: int = 1) -> void:
	score += amount
	score_label.text = str(score)
	$ScoreLabel/AudioStreamPlayer2D.play()
