extends RigidBody2D

signal dead

const START_SPEED = 250
const ACCELERATON = 7.5
const START_ANGLE_VARIANCE = PI / 4

var speed = START_SPEED

func _ready() -> void:
	var random_angle = RandomNumberGenerator.new().randf_range(PI - START_ANGLE_VARIANCE, PI + START_ANGLE_VARIANCE)
	self.apply_force(Vector2.from_angle(random_angle) * START_SPEED)

func _process(delta: float) -> void:
	speed += delta * ACCELERATON
	if position.x < 88 or position.x > 1062:
		dead.emit()

func _physics_process(delta: float) -> void:
	var current_velocity = self.linear_velocity
	self.linear_velocity = current_velocity.normalized() * speed


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("players"):
		var bounce_direction = get_angle_to(body.position) + PI
		var new_velocity = Vector2.from_angle(bounce_direction) * speed
		self.linear_velocity = new_velocity
