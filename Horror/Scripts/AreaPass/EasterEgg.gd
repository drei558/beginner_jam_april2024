extends Area2D

var EasterEgg = false



func _on_body_entered(body):
	if !EasterEgg:
		$"../AudioStreamPlayer".play()
		EasterEgg = true
