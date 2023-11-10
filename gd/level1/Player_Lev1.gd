extends CharacterBody3D

#class_name joe

signal toggle_inventory

@export var inventory_data: InventoryData

@onready var spring_arm_3d = $SpringArm3D
@onready var animation_player = $visuals/AnimationPlayer
@onready var visuals = $visuals
@onready var interact_ray = $SpringArm3D/Camera3D/InteractRay
@onready var camera_3d = $SpringArm3D/Camera3D


const SPEED = 18.0
const JUMP_VELOCITY = 12.0

@export var sens_horizontal = .5
@export var sens_vertical = .5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var canJump = true
@onready var respawn_area = $"../respawnArea"
@onready var virtual_joystick = $"../CanvasLayer/HUD/virtual_joystick"


func _ready():
	#animPlayer.play("idle")
	$"../BGSfx".play()
	
	

func _input(event):
	if event is InputEventScreenDrag and virtual_joystick.ongoing_drag:
		rotate_y(deg_to_rad(-event.relative.x* sens_horizontal))
		spring_arm_3d.rotate_x(deg_to_rad(-event.relative.y* sens_vertical))
		#Function to respawn the player at the original position

 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	

	move_and_slide()


func _on_virtual_joystick_analogic_chage(move: Vector2):
	animation_player.play("Running_B")
	$run.play()
	var _direction = (transform.basis * Vector3(-move.x, 0 ,-move.y)).normalized()
	
	var target_position = position + -_direction
	visuals.look_at(target_position)
	
	velocity.x = _direction.x * SPEED
	velocity.z = _direction.z * SPEED
	
	
	if velocity.x == _direction.x * 0:
		if velocity.z == _direction.y * 0:
			animation_player.play("Idle")
			$run.stop()
			
func _on_button_jump_pressed():
	# Handle Jump.
	var input_vector = Vector3()
	print("Jump button pressed")
	animation_player.play("Jump_Full_Long")
	velocity.y = JUMP_VELOCITY
	input_vector.z += 1
			
		

		
func _on_obstacle_body_entered_(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scene/quest_panel.tscn")

#item

func _on_area_3d_body_entered(_body):
	if interact_ray.is_colliding():
		interact_ray.get_collider().player_interact()


func _on_interact_button_pressed() -> void:
	if interact_ray.is_colliding():
		#print("interact with", interact_ray.get_collider())
		interact_ray.get_collider().player_interact()


func get_drop_position() -> Vector3:
	var direction = -camera_3d.global_transform.basis.z
	return camera_3d.global_position + direction





# to be kayo 

func _on_lily_out_1_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_2_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)
	
func _on_lily_out_3_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_4_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_5_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_6_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_7_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_8_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_lily_out_9_body_entered(_body):
	print("Player entered Lily Out 1 Area")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


#level 3



func _on_monkey_enemy_area_body_entered(_body):
	print("Player entered")
	if _body == self:
		print("Player entered ")
		# transfer
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)






