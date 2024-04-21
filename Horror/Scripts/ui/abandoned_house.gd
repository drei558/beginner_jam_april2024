extends Node2D

var note = false

func _input(event):
	if event.is_action_pressed("Interact"):
		if note:
			$CanvasLayer/Panel.visible = false
			$Player.speed = 100
			note = false
