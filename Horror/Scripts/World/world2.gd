extends Node2D

func _ready():
	$ColorRect/AnimationPlayer.play("BlackOut")
	$AudioStreamPlayer.play()
