extends Node
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var point_light_2d_2: PointLight2D = $PointLight2D2
@onready var point_light_2d_3: PointLight2D = $PointLight2D3
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var reset_ready := false


func reset():
	reset_ready = true

func fade():
	point_light_2d.queue_free()
	point_light_2d_2.queue_free()
	point_light_2d_3.queue_free()
	animation_player.play("fade_to_black")
	reset()

func _ready() -> void:
	EventBus.fade_black.connect(fade)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip") and reset_ready:
		get_tree().change_scene_to_file("res://start_screen.tscn")
