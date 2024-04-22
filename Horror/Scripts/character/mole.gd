extends CharacterBody2D

var speed = 80

@onready var nav = $NavigationAgent2D

@onready var player = get_tree().get_first_node_in_group("player")
var direction = Vector2()

func _physics_process(delta):
	look_at(player.global_position)
	nav.target_position = player.global_position
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = direction * speed
	
	move_and_slide()
	
	if velocity.length() != 0:
		$AnimationPlayer.play("Walking")
