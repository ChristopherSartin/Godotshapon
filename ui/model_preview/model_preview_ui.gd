extends Control

class_name ModelPreviewUI

@export var new_model_label : Label
@export var model_title_label : Label

func set_model_title(name : String, is_new_model : bool):
	new_model_label.visible = is_new_model
	model_title_label.text = name
