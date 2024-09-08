extends Node2D

@export var ik_target: Node2D
@onready var skeleton_2d = $Skeleton2D

func get_base_point() -> Vector2:
	var bonepose: Vector2 = skeleton_2d.get_bone_local_pose_override(0).get_origin()
	var skelepose: Vector2 = skeleton_2d.get_global_transform().get_origin()
	return bonepose + skelepose

func _get_bone_length(idx: int) -> float:
	return skeleton_2d.get_bone(idx).get_length()

func get_reach() -> float:
	var b0 = _get_bone_length(0)
	var b1 = _get_bone_length(1)
	var b2 = _get_bone_length(2)
	print(b0, " ", b1, " ", b2)
	return b0 + b1 + b2


# Called when the node enters the scene tree for the first time.
func _ready():
	var modification_stack: SkeletonModificationStack2D = skeleton_2d.get_modification_stack()
	modification_stack.get_modification(0).target_nodepath = ik_target.get_path()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# stop setting target
	#ik_target.global_position = get_global_mouse_position()
	pass
