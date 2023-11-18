extends State
class_name StopState

@onready var player: Player = owner

func enter(_msg: Dictionary = {}) -> void:
	player.label.text = "Ski"
	player.velocity.x = 0.0

func physics_update(delta: float) -> void:
	player.velocity.y -= player.decceleration * delta
	player.velocity.y = max(player.velocity.y, 0.0)
	player.move_and_slide()
	player.label.text = "Ski\nSpeed: " + str(player.velocity.y)

	if is_equal_approx(player.velocity.y, 0.0):
		player.state_machine.transition_to("Idle")
