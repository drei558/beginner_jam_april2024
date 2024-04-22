extends Node2D

@onready var animation = $CanvasLayer/AnimationPlayer
@onready var panel = $CanvasLayer/Panel
@onready var player = $CanvasLayer/Panel/Player2
@onready var player_text = $CanvasLayer/Panel/Player
@onready var rat = $CanvasLayer/Panel/Rat2
@onready var rat_text = $CanvasLayer/Panel/Rat

var dialogue = 0
var skipable = false

func _ready():
	get_tree().change_scene_to_file("res://Scenes/world/notes_world.tscn")
	animation.play("BlackOut")
	if Global.world1 == false:
		$Player.position = Vector2(184, 58)
		await get_tree().create_timer(2).timeout
		panel.visible = true
		$CanvasLayer/Panel/Dialogues/Pl1.visible = true
		animation.play("Pl1")
		await animation.animation_finished
		skipable = true
		$CanvasLayer/Panel/Label.visible = true
	else:
		$Player.position = Vector2(136, 87)
		$Rat.visible = true
		await get_tree().create_timer(2).timeout
		panel.visible = true
		$CanvasLayer/Panel/Dialogues/Pl1.visible = false
		hide_player()
		app_rat()
		$CanvasLayer/Panel/Dialogues/Rt1.visible = true
		animation.play("Rt1")
		await animation.animation_finished
		skipable = true
		$CanvasLayer/Panel/Label.visible = true
		

func _input(event):
	if event.is_action_pressed("Interact"):
		$CanvasLayer/Panel/Label.visible = false
		if skipable == true:
			dialogue += 1
		if Global.world1 == false:
			if dialogue == 1:
				panel.visible = false
				await get_tree().create_timer(1).timeout
				$AudioStreamPlayer.play()
				await get_tree().create_timer(1).timeout
				animation.play("BlackIn")
				await animation.animation_finished
				get_tree().change_scene_to_file("res://Scenes/world/world1.tscn")
		else:
			if dialogue == 1:
				skipable = false
				hide_rat()
				app_player()
				$CanvasLayer/Panel/Dialogues/Rt1.visible = false
				$CanvasLayer/Panel/Dialogues/Pl2.visible = true
				animation.play("Pl2")
				await animation.animation_finished
				$CanvasLayer/Panel/Label.visible = true
				skipable = true
			if dialogue == 2:
				skipable = false
				hide_player()
				app_rat()
				$CanvasLayer/Panel/Dialogues/Rt2.visible = true
				$CanvasLayer/Panel/Dialogues/Pl2.visible = false
				animation.play("Rt2")
				await animation.animation_finished
				$CanvasLayer/Panel/Label.visible = true
				skipable = true
			if dialogue == 3:
				skipable = false
				animation.play("BlackIn")
				await animation.animation_finished
				get_tree().change_scene_to_file("res://Scenes/world/world2.tscn")

func hide_player():
	player.visible = false
	player_text.visible = false

func hide_rat():
	rat.visible = false
	rat_text.visible = false

func app_player():
	player.visible = true
	player_text.visible = true

func app_rat():
	rat.visible = true
	rat_text.visible = true
