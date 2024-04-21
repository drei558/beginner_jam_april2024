extends Node2D

@export var interaction_area: Area2D
@export var sprite: Sprite2D

@onready var house = $".."

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	house.note = true
	$"../CanvasLayer/Panel".visible = true
	$"../Player".speed = 0
	$".".queue_free()

