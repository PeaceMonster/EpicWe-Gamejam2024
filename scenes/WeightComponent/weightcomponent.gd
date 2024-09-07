extends Node

@export var weight := 10.0
@export var grab_component : GrabComponent
var hand_speed_init := 2.0

func slow_hand():
	var mouse = get_tree().get_first_node_in_group("mouse_target")
	hand_speed_init = mouse.drag_coefficient
	mouse.drag_coefficient = weight

func restore_hand_speed():
	var mouse = get_tree().get_first_node_in_group("mouse_target")
	mouse.drag_coefficient = hand_speed_init
	
func _ready() -> void:
	grab_component.grab_start.connect(slow_hand)
	grab_component.grab_end.connect(restore_hand_speed)
