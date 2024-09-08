extends Node2D



@onready var gratecomponent: GrateComponent = $gratecomponent

func fade_to_black() -> void:
	EventBus.fade_to_black()

func _ready() -> void:
	gratecomponent.grate_stop.connect(fade_to_black)
