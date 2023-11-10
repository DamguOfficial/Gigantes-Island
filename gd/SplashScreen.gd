extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play("fadeOut")
	get_tree().create_timer(6)


	


func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")
