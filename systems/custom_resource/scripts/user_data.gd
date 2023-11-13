extends Resource

class_name UserData

@export var _collected_models : Dictionary

func add_model(name : String):
	var ret = false
	
	if _collected_models.has(name):
		_collected_models[name] += 1
	else:
		_collected_models[name] = 1
		ret = true
		
	ResourceSaver.save(self)  
	
	return ret

func contains(name : String):
	return _collected_models.has(name)

func count():
	return _collected_models.size()
