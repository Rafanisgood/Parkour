extends Node
@onready var panel = %Panel



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed == true):
		get_tree().paused = true
		panel.show()

func _on_resume_pressed():
		panel.hide()
		get_tree().paused = false

func _on_main_menu_pressed():
	panel.hide()
	get_tree().change_scene_to_file("res://scenes/menu/main_menu_good.tscn")
	

func _on_restartlvl_pressed():
	panel.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_restartall_pressed():
	panel.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levelz/level1.tscn")
