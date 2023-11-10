extends Control

var question

@onready var animation_player1 = $"../../stalls/1/CharacterBody3D/AnimationPlayer"
@onready var animation_player2 = $"../../stalls/2/CharacterBody3D2/AnimationPlayer"
@onready var animation_player3 = $"../../stalls/3/CharacterBody3D/AnimationPlayer"
@onready var animation_playerQG = $"../../stalls/mainQuest/questPlace/CharacterBody3D/AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready():
	question = get_node("QuestPanel1/Quest/VBoxContainer/Q1")
	$QuestPanel1/Quest/VBoxContainer/Q1.text = "Through stormy seas, a fearsome sight,
	Their ship sails dark as the endless night.
	They came with swords, causing fear 
	and pain,Turning joy to sorrow, 
	like a dark stain.

	Who are they?"
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if question == answer:
	#	get_tree().change_scene_to_file("res://scene/Main.tscn")
	pass

func _on_button_close_panel_pressed():
	$QuestPanel1.visible = false
	$virtual_joystick.visible = true 
	$ButtonJump.visible = true
	$"Jump1(1)".visible = true
	$pause/menu/close/close.play()

func _on_yes_pressed():
	$QuestPanel1.visible = true
	$choice.visible = false

func _on_no_pressed():
	$choice.visible = false
	

func _on_direction_pressed():
	$Direction.visible = false
	$Direction/click.play()


func _on_pause_pressed():
	$pause/menu.visible = true
	$Direction/click.play()

func _on_close_pressed():
	$pause/menu.visible = false
	$pause/menu/close/close.play()


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


func _on_area_3d_area_entered(_area):
	print("entered")
	$dialogue/npc1.visible = true
	animation_player1.play("Interact")
	

func _on_area_3d_area_exited(_area):
	print("exit")
	animation_player2.play("Interact")
	
	
func _on__area_entered(_area):
	print("entered")
	animation_playerQG.play("Interact")
	$dialogue/npc2.visible = true

	
func _on_quest_area_area_entered(_area):
	print("entered")
	$"dialogue/Quest Giver/D1".visible = true
	animation_player3.play("Interact")

func _on_npc_3_area_entered(_area):
	animation_player3.play("Interact")
	print("entered")
	$dialogue/npc3.visible = true
	
	
#exited

func _on__area_exited(_area):
	print("exit")
	animation_playerQG.play("Idle")
	$dialogue/npc3.visible = false
	
func _on_quest_area_area_exited(_area):
	print("exit")
	animation_playerQG.play("Idle")
	$"../../item/box".visible = true
	#$"../../stalls/mainQuest/questPlace/questArea".queue_free()
	#$"../../stalls/mainQuest/questPlace/chest".visible = true
	#$"../../item".visible = true
	
func _on_npc_3_area_exited(_area):
	animation_player3.play("Idle")
	$dialogue/npc3.visible = false
	print("exit")

func _on_level_complte_pressed():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")


func _on_area_3_area_exited(_area):
	animation_player1.play("Idle")
	$dialogue/npc1.visible = false


func _on_area_2_area_exited(_area):
	animation_player2.play("Idle")
	$dialogue/npc2.visible = false


#npc dialogue
func _on_transparent_pressed():
	$dialogue/npc1.visible = false
	$dialogue/npc2.visible = false
	$dialogue/npc3.visible = false
	

func _on_tans_1_pressed():
	$dialogue/plyr/Player.visible = true
	$"dialogue/Quest Giver/D1".visible = false


func _on_trans_player_pressed():
	$"dialogue/Quest Giver/D2".visible = true
	$dialogue/plyr/Player.visible = false


func _on_trans_2_pressed():
	$"dialogue/Quest Giver/D2".visible = false
	$QuestPanel1.visible = true

#L1 Wrong ans Dialogue
func _on_wrng_dia_1_pressed():
	$dialogue/plyr/Wrng1.visible = true
	$"dialogue/Quest Giver/Wrong/wrongAns1".visible = false
	
func _on_plyr_wrng_dia_1_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns".visible = true
	$dialogue/plyr/Wrng1.visible = false

func _on_wrng_dia_2_pressed():
	$dialogue/plyr/Wrng2.visible = true
	$"dialogue/Quest Giver/Wrong/wrongAns".visible = false

func _on_plyr_wrng_dia_2_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns2".visible = true
	$dialogue/plyr/Wrng2.visible = false

func _on_wrng_dia_3_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns2".visible = false
	$"../../item/box".visible = true


#item inventory
func _on_shell_2_area_entered(_area):
	$"../../item/shell".visible = true

func _on_bottle_2_area_entered(_area):
	$"../../item/box2".visible = true

func _on_coconut_area_entered(_area):
	$"level complete".visible = true


#q1 answer button 
func _on_right_ans_pressed():
	$"level complete".visible = true
	$QuestPanel1.visible = false
	$QuestPanel1/click.play()
	
func _on_wrng_ans_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns1".visible = true
	$QuestPanel1.visible = false
	$QuestPanel1/click.play()
