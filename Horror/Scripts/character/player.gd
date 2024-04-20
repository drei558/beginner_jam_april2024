extends CharacterBody2D

@export var speed = 300

func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("Walk_Left", "Walk_Right", "Walk_Up", "Walk_Down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
	if velocity.length() != 0:
		$AnimationPlayer.play("Walking")
	else:
		$AnimationPlayer.stop()
