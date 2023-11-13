extends Node

@export var models_data : ArrayVariable
@export var user_data : UserDataVariable

@export var user_data_path : String = "user://save"
@export var user_data_file_name : String = "save_data.tres"
@export var resource_folder : String = "res://assets/models";

func _ready():
	get_models_data()
	get_user_data()

func get_user_data():
	DirAccess.make_dir_absolute(user_data_path)
	
	var file_location = user_data_path + "/" + user_data_file_name
	
	if(!ResourceLoader.exists(file_location)):
		var data = UserData.new()
		ResourceSaver.save(data, file_location)
		
	user_data.value = ResourceLoader.load(file_location)


func get_models_data():
	models_data.value = []
	
	var model_root := DirAccess.open(resource_folder)
	if model_root:
		model_root.list_dir_begin()
		var folder_name = model_root.get_next()
		
		while folder_name != "":
			if model_root.current_is_dir():
				var current_path = model_root.get_current_dir() + "/" + folder_name
				var json = get_json_from_file(current_path + "/meta.json")
				var model_object : ModelDataObject= ModelDataObject.new(json, current_path)
				models_data.value.append(model_object)
			folder_name = model_root.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
	ResourceSaver.save(models_data)
		
	queue_free()

func get_json_from_file(path):
	var data_file = FileAccess.open(path, FileAccess.READ)
	var json_string = data_file.get_as_text()
	
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var data_received = json.data
		
		if typeof(data_received) == TYPE_DICTIONARY:
			return data_received # Prints array
		else:
			print("Unexpected data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
