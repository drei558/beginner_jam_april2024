extends Area2D

@export var interaction_area: Area2D
@export var sprite: Sprite2D

@export var interaction_text: Array[String] = ["Don't lay down. The day has just begun..."]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogManager.start_dialog(global_position, interaction_text)
	await DialogManager.dialog_finished
