extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade") 
	get_tree().create_timer(8)
	$AnimationPlayer.play("fadeOut")
	get_tree().create_timer(5)


	


func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://scene/SplashScreen.tscn")
