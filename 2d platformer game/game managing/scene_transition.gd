extends Node
	


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/levelz/level1.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levelz/level2.tscn")
	
