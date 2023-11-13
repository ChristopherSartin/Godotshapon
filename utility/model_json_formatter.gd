@tool
extends Node3D

@export var button_save_to_file : bool = false : 
	set = _save

@export var model_adjustment_node : Node3D
@export var model_path : String = "res://assets/models/"

@export var file_name : String = ""
@export var icon_name : String = ""

@export var creation_date : String = ""

@export var obj_name : String = ""
@export_multiline var obj_description : String = ""

func _save(val):
	if(!val):
		return
	
	var dict : Dictionary
	
	dict["name"] = obj_name
	dict["description"] = obj_description
	dict["icon_name"] = icon_name
	dict["file_name"] = file_name
	dict["creation_date"] = creation_date
	
	dict["scale_x"] = model_adjustment_node.scale.x
	dict["scale_y"] = model_adjustment_node.scale.y
	dict["scale_z"] = model_adjustment_node.scale.z
	
	dict["position_x"] = model_adjustment_node.position.x
	dict["position_y"] = model_adjustment_node.position.y
	dict["position_z"] = model_adjustment_node.position.z
	
	dict["rotation_x"] = model_adjustment_node.rotation_degrees.x
	dict["rotation_y"] = model_adjustment_node.rotation_degrees.y
	dict["rotation_z"] = model_adjustment_node.rotation_degrees.z
	
	var json = JSON.stringify(dict)
	
	var file = FileAccess.open(model_path + "/meta.json", FileAccess.WRITE)
	file.store_line(json)
	file.close()

