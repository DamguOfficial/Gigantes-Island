extends Node3D

const PickUp = preload("res://scene/pick up.tscn")

@onready var player = $Player
@onready var inv_ui = $CanvasLayer/HUD/InvUI
@onready var respawn_area = $respawnArea

#const monkey = preload("res://scene/Level3/monkey.tscn")
@onready var monkey = $monkey
const SPAWN_AREA_EXTENTS = Vector3(20, 0, -20)  # Adjust the extents of your spawning area.
var spawnedMonkeys = 0
var maxMonkeys = 10  # Maximum monkeys you want to spawn.

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

func _on_monkey_spawn_t_imer_timeout():
	if spawnedMonkeys < maxMonkeys:
		var monkey_instance = monkey.duplicate()
		monkey_instance.transform.origin = Vector3(randi_range(-int(SPAWN_AREA_EXTENTS.x), int(SPAWN_AREA_EXTENTS.x)),0,randi_range(-int(SPAWN_AREA_EXTENTS.z), int(SPAWN_AREA_EXTENTS.z)))
		add_child(monkey_instance)
		monkey_instance.visible = true
		monkey_instance.set_process_input(true)
		spawnedMonkeys += 1
	
func _on_monkey_player_collision():	
	print("..")
