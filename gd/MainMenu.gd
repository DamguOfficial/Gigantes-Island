extends Node2D




	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/video_stream_player.tscn")



func _on_play_pressed():
	get_tree().change_scene_to_file("res://scene/video_stream_player.tscn")
	


func _on_video_stream_player_finished():
	$VideoStreamPlayer.play()
	$menu/select.play()
	
