extends Area2D

@onready var animation = $"../ColorRect/AnimationPlayer"
@onready var player = $"../Player"


func _ready():
	animation.play("BlackOut")


func _on_body_entered(body):
	player.speed = 0
	animation.play("BlackIn")
	await animation.animation_finished
	get_tree().change_scene_to_file("res://Scenes/world/forest_1.tscn")
