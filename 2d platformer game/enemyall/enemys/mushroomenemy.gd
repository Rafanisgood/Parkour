extends RigidBody2D
@onready var gamemanager = %GAMEMANAGER


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x	
		if (y_delta > 1):
			print("Enemy died")
			queue_free()
			gamemanager.add_point()
			body.jump()
		else:
			print("Decrease player health")
			gamemanager.die()
			gamemanager.minus_point()
			if (x_delta > 100):
				body.side_jump(500)
			else:
				body.side_jump(-500)
