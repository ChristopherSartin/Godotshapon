extends Node

@export var current_scene : Node3D

@export var root : Node3D

@export var gosha_scene : PackedScene
@export var collection_scene : PackedScene
@export var model_view_scene : PackedScene

func _ready():
	Events.connect("move_to_gosha_scene", open_gosha)
	Events.connect("move_to_collection_scene", open_collection)
	Events.connect("move_to_model_viewer_scene", open_model_viewer)

func open_gosha():
	current_scene.queue_free()
	current_scene = gosha_scene.instantiate()
	root.add_child(current_scene)

func open_collection():
	current_scene.queue_free()
	current_scene = collection_scene.instantiate()
	root.add_child(current_scene)
	
func open_model_viewer():
	current_scene.queue_free()
	current_scene = model_view_scene.instantiate()
	root.add_child(current_scene)
