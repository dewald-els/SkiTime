extends State
class_name FallState

@onready var player: Player = owner

@export var fall_time: float = 30.0

func enter(_msg: Dictionary = {}) -> void:
	player.label.text = "Fall"
	

func physics_update(delta: float) -> void:
	player.scale = Vector2(lerp(player.scale.x, 1.0, fall_time * delta) , lerp(player.scale.y, 1.0, fall_time * delta))
	player.shadow.transform.origin = Vector2(
		lerp(player.shadow.transform.origin.x, 0.0, fall_time * delta),
		lerp(player.shadow.transform.origin.y, 0.0, fall_time * delta)
	)
	player.shadow.scale = Vector2(
		lerp(player.shadow.scale.x, 1.0, fall_time * delta),
		lerp(player.shadow.scale.y, 1.0, fall_time * delta),
	)
	if is_equal_approx(player.scale.x, 1.0):
		player.scale = Vector2(1, 1)
		player.state_machine.transition_to("Ski")
		
	player.move_and_slide()
