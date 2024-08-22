extends Area2D
@onready var gamemanager = %GAMEMANAGER

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		gamemanager.add_point()
