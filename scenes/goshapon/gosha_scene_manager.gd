extends Node3D

@export var models_data : ArrayVariable
@export var user_data : UserDataVariable

@export var main_camera : Camera3D

@export var director : AnimationPlayer

@export var model_preview : ModelViewer
@export var model_preview_ui : ModelPreviewUI

@export var gosha_ui : Control

var _rng = RandomNumberGenerator.new()

func collect_random_model():
	
	#Add model to the user data
	var index = _rng.randi_range(0, models_data.value.size() - 1)
	var name = models_data.value[index].name
	var is_new_model = user_data.value.add_model(name)
	
	#Set up labels
	model_preview_ui.set_model_title(name, is_new_model)
	
	#Instantiate model for the model viewer
	model_preview.set_model(models_data.value[index])
	
	Events.emit_signal("model_added_to_user_data", name)
	
	director.play("DispenseCutscene")

func close_model_viewer():
	model_preview.visible = false
	model_preview_ui.visible = false
	gosha_ui.visible = true;
	main_camera.make_current()
