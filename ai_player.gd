extends RigidBody2D

@onready var ball = $"../Ball"

const SPEED = 500
const DAMPING = 5
const Y_POSITION_DELAY_FACTOR = 5
const MAX_ERROR = 10
var rng = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	if ball.position.x > 536 and ball.linear_velocity.x > 0:
		var y_position_delay = (position.x - ball.position.x) / Y_POSITION_DELAY_FACTOR
		var error = rng.randf_range(MAX_ERROR, MAX_ERROR)
		var move_up = ball.position.y < position.y - y_position_delay + MAX_ERROR
		var move_down = ball.position.y > position.y + y_position_delay + MAX_ERROR
		if move_up: 
			self.apply_force(Vector2.UP * SPEED)
		if move_down:
			self.apply_force(Vector2.DOWN * SPEED)
		if move_up or move_down:
			self.linear_damp = 0
		else:
			self.linear_damp = DAMPING
