extends Control

var question

@onready var respawn_area = $"../../respawnArea"

@onready var animation_NPC1 = $"../../npc/npc1/AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready():
	question = get_node("QuestPanel1/Quest/VBoxContainer/Q1")
	$QuestPanel3/Quest/VBoxContainer/Q3.text = "A giant's love, strong and true,
	For their wedding,
	He gathered things from distant lands
	But pirates came, love couldn't last.
	In sorrow, he cast them away,
	Above the sea, they still sway.
	
	What were those things, tossed in despair?"
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if question == answer:
	#	get_tree().change_scene_to_file("res://scene/Main.tscn")
	pass

func _on_button_close_panel_pressed():
	$QuestPanel3.visible = false
	



	



func _on_direction_pressed():
	$Direction.visible = false


func _on_pause_pressed():
	$pause/menu.visible = true


func _on_close_pressed():
	$pause/menu.visible = false


func _on_home_pressed():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")


func _on_play_pressed():
	#get_tree().change_scene_to_file("res://scene/Level2.tscn")
	$pause/menu.visible = false


func _on_sound_pressed():
	$"../../Player/run".stop()
	$"../../BGSfx".stop()
	$pause/menu/Mute.visible = true
	$pause/menu/Sound.visible = false


func _on_mute_pressed():
	$"../../Player/run".play()
	$"../../BGSfx".play()
	$pause/menu/Mute.visible = false
	$pause/menu/Sound.visible = true

#exited

func _on__area_exited(_area):
	print("exit")
	animation_NPC1.play("Idle")
	$dialogue/npc3.visible = false
	

func _on_level_complte_pressed():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")





#quest
func _on_l_3_area_area_entered(_area):
	$QuestPanel3.visible = true
	
func _on_wrng_ans_3_pressed():
	$QuestPanel3.visible = false
	

	


#item
func _on_shell_2_area_entered(_area):
	$"../../item/shell".visible = true

func _on_bottle_2_area_entered(_area):
	$"../../item/box2".visible = true
	
func _on_coconut_area_entered(_area):
	$levelComplte.visible = true

#npc
func _on_npc_area_area_entered(_area):
	$dialogue/npc1.visible = true
	animation_NPC1.play("Interact")
	
func _on_transparent_pressed():
	$dialogue/npc1.visible = false
	animation_NPC1.play("Idle")

func _on_npc_area_area_exited(_area):
	$dialogue/npc1.visible = false
	animation_NPC1.play("Idle")


func _on_ans_pressed():
	$levelComplte.visible = true


func _on_wrng_pressed():
	$"../../item/box".visible = true
	$QuestPanel3.visible = false
