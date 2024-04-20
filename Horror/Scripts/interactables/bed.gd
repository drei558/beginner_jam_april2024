extends Area2D

@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D

var interaction_text: Array[String] = ["Don't lay down. The day has just begun..."]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogManager.start_dialog(global_position, interaction_text)
	await DialogManager.dialog_finished
