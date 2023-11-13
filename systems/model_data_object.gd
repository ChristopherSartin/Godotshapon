extends Object

class_name ModelDataObject

var name : String
var description: String
var icon_path : String
var model_path : String

var position : Vector3
var rotation : Vector3
var scale : Vector3

func _init(jsonObject, path):
	name = jsonObject["name"]
	description = jsonObject["description"]
	icon_path = path + "/" + jsonObject["icon_name"]
	model_path = path + "/" + jsonObject["file_name"]
	
	position = Vector3 (
			jsonObject["position_x"],
			jsonObject["position_y"],
			jsonObject["position_z"],
		)
	
	rotation = Vector3 (
		jsonObject["rotation_x"],
		jsonObject["rotation_y"],
		jsonObject["rotation_x"],
	)
	
	scale = Vector3 (
		jsonObject["scale_x"],
		jsonObject["scale_y"],
		jsonObject["scale_z"],
	)
