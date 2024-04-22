extends Area2D

@onready var interaction_area = $InteractionArea
@onready var animation = $"../ColorRect/AnimationPlayer"

func _ready():
	animation.play("BlackIn")
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	animation.play("BlackOut")
	await animation.animation_finished
	Global.world1 = true
	get_tree().change_scene_to_file("res://Scenes/world/cutscene_1.tscn")
