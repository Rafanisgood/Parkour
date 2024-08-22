extends Node
@onready var label = %Label
@export var hearts : Array[Node]
var points = 0
var health = 3

func die():
	health -= 1
	print(health)
	for h in 3:
		if (h < health):
			hearts[h].show()
		else:
			hearts[h].hide()
	if (health == 0):
		get_tree().reload_current_scene()
func add_point():
	points += 1
	print(points)
	label.text = "Points: " + str(points)
func minus_point():
		points -= 1
		print(points)
		label.text = "Points: " + str(points)
	
