extends Control

class_name CollectionItem

var model_data_object : ModelDataObject
var _enabled : bool = false

@export var name_label : Label
@export var background_texture_rect : TextureRect
@export var icon_texture_rect : TextureRect
@export var question_mark : TextureRect

func initialize(data_object : ModelDataObject, collected : bool = false):
	set_enabled(collected)
	
	model_data_object = data_object
	
	name_label.text = model_data_object.name
	background_texture_rect.texture = load(model_data_object.icon_path)
	icon_texture_rect.texture = load(model_data_object.icon_path)	
	
func _on_v_box_container_gui_input(event):
	if _enabled && event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Events.emit_signal("move_to_model_viewer_scene")
			Events.emit_signal("model_data_object_selected", model_data_object)
			
func set_enabled(value : bool):
	_enabled = value
	question_mark.visible = !value
	icon_texture_rect.visible = value
