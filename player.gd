extends RigidBody2D

const SPEED = 500
const DAMPING = 5

var is_player_1 = false

var player_1_keys = [KEY_W, KEY_S]
var player_2_keys = [KEY_UP, KEY_DOWN]
var player_keys

var mouse_held = false

func _ready() -> void:
	if self.get_meta("player_1"):
		player_keys = player_1_keys
	else: 
		player_keys = player_2_keys

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		mouse_held = true
		print("Click")
	elif Input.is_action_just_released("click"):
		mouse_held = false
		print("Un-Click")

func _physics_process(delta: float) -> void:
	var mouse_position_y = get_global_mouse_position().y
	var move_up = Input.is_key_pressed(player_keys[0]) or (mouse_held and mouse_position_y < position.y)
	var move_down = Input.is_key_pressed(player_keys[1]) or (mouse_held and mouse_position_y > position.y)
	if move_up: 
		self.apply_force(Vector2.UP * SPEED)
	if move_down:
		self.apply_force(Vector2.DOWN * SPEED)
	if move_up or move_down:
		self.linear_damp = 0
	else:
		self.linear_damp = DAMPING
