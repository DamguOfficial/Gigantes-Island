extends Node3D


var camrot_h = 0

	
func _input(event):
		if event is InputEventJoypadMotion:
			camrot_h += -event.relative.x
			
func _physics_process(_delta):
	
	$h.rotation_degrees.y = camrot_h
