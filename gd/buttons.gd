extends Control




func _on_lore_pressed():
	$lore.visible = true
	$"../../menuSound".stream_paused = true
	$lore/LoreAboutAudio.play()
	$"../../menu/select".play()

func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")





func _on_about_pressed():
	$"../../menu/select".play()
	$About.visible = true
	$"../../menuSound".stream_paused = true
	$lore/LoreAboutAudio.play()
