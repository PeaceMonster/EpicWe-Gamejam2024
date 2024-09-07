extends Node2D

@export var ik_target : Node2D 
@onready var skeleton_2d = $Skeleton2D


# Called when the node enters the scene tree for the first time.
func _ready():
	ik_target.global_position = $Skeleton2D/Bone2D/Bone2D/Bone2D/Sprite2D.global_position
	var modification_stack: SkeletonModificationStack2D = skeleton_2d.get_modification_stack()
	modification_stack.get_modification(0).target_nodepath = ik_target.get_path()
	
