extends Control

var question



# Called when the node enters the scene tree for the first time.
func _ready():
	question = get_node("QuestPanel/VBoxContainer/Label3")
	$QuestPanel/VBoxContainer/Label3.text="whats your name?"
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if question == answer:
	#	get_tree().change_scene_to_file("res://scene/Main.tscn")
	pass

func _on_button_close_panel_pressed():
	$QuestPanel.visible = false
	


func _on_area_3d_quest_item_1_body_entered(_body):
	$QuestPanel.visible = true
	
	

	
	
		
		
	
	
	

	




func _on_line_edit_text_submitted(new_text):
	get_tree().change_scene_to_file("res://scene/Main.tscn")
	
	var ans = "joe"
	
	if new_text == ans:
		get_node("QuestPanel/VBoxContainer/Label3")
	
		
