extends Button

@export var signal_name : String

func emit():
	Events.emit_signal(signal_name)
