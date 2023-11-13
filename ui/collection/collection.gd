extends Control

class_name CollectionUI

@export var models_list : ArrayVariable
@export var element : PackedScene
@export var element_container : Control
@export var user_data : UserDataVariable

func _ready():
	Events.connect("model_added_to_user_data", _set_child_enbaled)

func _process(delta):
	if not element_container.get_child_count() == models_list.value.size():
		for n in element_container.get_children():
			element_container.remove_child(n)
			n.queue_free()
		
		for m in models_list.value:
			var instance = element.instantiate()
			instance.initialize(m, user_data.value.contains(m.name))
			instance.name = m.name
			element_container.add_child(instance)

func _set_child_enbaled(name : String):
	var model_list_item = element_container.get_node(name)
	
	if model_list_item:
		model_list_item.set_enabled(true);
