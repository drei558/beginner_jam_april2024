extends ColorRect

@onready var animation = $AnimationPlayer

func _ready():
	animation.play("BlackOut")
