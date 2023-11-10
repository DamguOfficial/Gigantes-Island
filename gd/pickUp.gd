extends Area3D


@export var slot_data: SlotData
@onready var mesh_instance_3d = $MeshInstance3D
#@onready var sprite_3d = $Sprite3D

func _ready() -> void:
	#sprite_3d.texture = slot_data.item_data.texture
	pass


func _on_body_entered(_body) -> void:
	if _body as InventoryData:
		var body = _body as InventoryData
		if body.inventory_data:
			if _body.inventory_data.pick_up_slot(slot_data):
				queue_free()
				print("entered")
