extends RigidBody2D

const SPEED = 500
const DAMPING = 5

var is_player_1 = false

var player_1_keys = [KEY_W, KEY_S]
var player_2_keys = [KEY_UP, KEY_DOWN]
var player_keys

func _ready() -> void:
	if self.get_meta("player_1"):
		player_keys = player_1_keys
	else: 
		player_keys = player_2_keys

func _physics_process(delta: float) -> void:
	var move_up = Input.is_key_pressed(player_keys[0])
	var move_down = Input.is_key_pressed(player_keys[1])
	if move_up: 
		self.apply_force(Vector2.UP * SPEED)
	if move_down:
		self.apply_force(Vector2.DOWN * SPEED)
	if move_up or move_down:
		self.linear_damp = 0
	else:
		self.linear_damp = DAMPING
		
