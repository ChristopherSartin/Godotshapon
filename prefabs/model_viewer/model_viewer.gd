extends Node3D

class_name ModelViewer

@export var speed : float = 5
@export var camera : Camera3D

@export var model : Node3D
@export var model_container : Node3D

func _ready():
	Events.connect("model_data_object_selected", set_model)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if model == null:
		return
	
	if Input.is_action_just_pressed("reset"):
		model_container.rotation = Vector3.ZERO
		return
	
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var rotation_vector : Vector2 = input * speed * delta
	
	model_container.rotate(camera.basis.x, rotation_vector.y)
	model_container.rotate(camera.basis.y, rotation_vector.x)
	

func set_model (data : ModelDataObject):
	model_container.rotation = Vector3.ZERO
	
	if model != null:
		remove_child(model)
		model.queue_free()
		model = null
		
	var instance = load(data.model_path).instantiate()
	
	model = instance
	model_container.add_child(model)
	
	model.position = data.position
	model.rotation_degrees = data.rotation
	model.scale = data.scale
