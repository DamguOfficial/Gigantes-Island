extends Node3D

const PickUp = preload("res://scene/pick up.tscn")

@onready var player = $Player
@onready var inv_ui = $CanvasLayer/HUD/InvUI
@onready var respawn_area = $respawnArea


const SPAWN_AREA_EXTENTS = Vector3(20, 0, 10)  # Adjust the extents of your spawning area.
 
var timer: Timer


func _ready() -> void:
	inv_ui.set_player_inventory_data(player.inventory_data)

	for node in get_tree().get_nodes_in_group("external_inventory"):
		node.toggle_inventory.connect(toggle_inventory_interface)
		
	#timer
	timer =Timer.new()
	add_child(timer)
	timer.wait_time = 3.00 # Set the time between spawns (in seconds).
	timer.start()
		

func toggle_inventory_interface(external_inventory_owner = null) -> void:
	inv_ui.visible = not inv_ui.visible
	
	if external_inventory_owner:
		inv_ui.set_external_inventory(external_inventory_owner)


func _on_inv_ui_drop_slot_data(slot_data):
	var pick_up = PickUp.instantiate()
	pick_up.slot_data = slot_data
	pick_up.position = Vector3.UP
	add_child(pick_up)


#level 3


