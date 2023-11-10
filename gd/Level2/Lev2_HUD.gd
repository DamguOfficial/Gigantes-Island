extends Control

var question


@onready var npc = $"../../npc/qg/CharacterBody3D2/AnimationPlayer"
@onready var questGiver = $"../../stalls/mainQuest/questPlace/CharacterBody3D/L1QGiv/AnimationPlayer"
@onready var respawn_area = $"../../respawnArea"




# Called when the node enters the scene tree for the first time.
func _ready():
	question = get_node("QuestPanel1/Quest/VBoxContainer/Q1")
	$QuestPanel1/Quest/VBoxContainer/Q1.text = "Shining sharp, darkness it brought, 
	In the pirate's grip, a life it caught.
	Silent and deadly, its purpose unkind,
	Love's tragedy, forever entwined.”
	
	What is described?"
	
	$QuestPanel2/Quest/VBoxContainer/Q2.text = "I flow from eyes, born of sadness and pain, 
	the soul’s gentle rain."
	
	$QuestPanel3/Quest/VBoxContainer/Q3.text = "Life's companion, it comes to all, 
	Without a warning, a sudden call. 
	It parts us from those we dearly hold, 
	Leaving us in sorrow, alone and cold."
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if question == answer:
	#	get_tree().change_scene_to_file("res://scene/Main.tscn")
	pass

func _on_button_close_panel_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	$virtual_joystick.visible = true 
	$ButtonJump.visible = true
	$"Jump1(1)".visible = true



	

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





	



#Level 2




# npc
func _on_tans_1_pressed():
	$npc_dia/npc/D2.visible = true
	$npc_dia/npc/D1.visible = false
	
func _on_trans_2_pressed():
	$npc_dia/plyr_npc/Player.visible = true
	$npc_dia/npc/D2.visible = false
	
func _on_babaylan_area_area_entered(area):
	$npc_dia/npc/D1.visible = true

func _on_trans_player_pressed():
	$npc_dia/npc/D4.visible = true
	$npc_dia/plyr_npc/Player.visible = false
	
func _on_trans_3_pressed():
	$npc_dia/npc/D3.visible = false

func _on_trans_4_pressed():
	$npc_dia/plyr_npc/Player2.visible = true
	$npc_dia/npc/D4.visible = false

func _on_trans_player_2_pressed():
	$npc_dia/npc/D3.visible = true
	$npc_dia/plyr_npc/Player2.visible = false


func _on_l_2_quest_area_area_entered(area):
	$npc_dia/serpent/D1.visible = true
	
func _on_tans_1_serpent_pressed():
	$npc_dia/serpent/D1.visible = true
	$npc_dia/plyr2/Player.visible = true

func _on_player_tap_pressed():
	$npc_dia/serpent/D2.visible = true
	$npc_dia/plyr2/Player.visible = false

func _on_trans_d_2_pressed():
	$npc_dia/serpent/D2.visible = false
