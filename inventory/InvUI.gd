extends Control

signal drop_slot_data(slot_data:SlotData)

var grabbed_slot_data: SlotData
var external_inventory_owner

@onready var inventory_box = $InventoryBox
@onready var grabbed_slot = $GrabbedSlot
@onready var external_inv_box = $externalInvBox

func _physics_process(_delta: float) -> void:
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5, 5)

func set_player_inventory_data(inventory_data:InventoryData) -> void:
	inventory_data.inventory_interact.connect(on_inventory_interact)
	inventory_box.set_inventory_data(inventory_data)
	external_inv_box.set_inventory_data(inventory_data)

func set_external_inventory(_external_inventory_owner) -> void:
	external_inventory_owner = _external_inventory_owner
	var invetory_data = external_inventory_owner.inventory_data
	
	invetory_data.inventory_interact.connect(on_inventory_interact)
	external_inv_box.set_inventory_data(invetory_data)
	
	external_inv_box.show()
 
func on_inventory_interact(inventory_data: InventoryData, _index: int) -> void:
	print("%s %s" % [inventory_data, _index])

	match [grabbed_slot_data, _index]:
		[null, _index]:
			grabbed_slot_data = inventory_data.grab_slot_data(_index)
		[_, _index]:
			grabbed_slot_data = inventory_data.drop_slot_data(grabbed_slot_data, _index)
		[null, _index]:
			grabbed_slot_data = inventory_data.grab_slot_data(_index)
		[_, _index]:
			grabbed_slot_data = inventory_data.drop_single_slot_data(grabbed_slot_data, _index)	
	update_grabbed_slot()
	
	
func update_grabbed_slot() -> void:
	if grabbed_slot_data:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbed_slot_data)
	else :
		grabbed_slot.hide()


func _on_gui_input(event):
	if event is InputEventScreenTouch and grabbed_slot_data:
			drop_slot_data.emit(self)
			grabbed_slot_data = null
		
	update_grabbed_slot()
	print("drop")
