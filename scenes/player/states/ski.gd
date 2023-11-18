extends State
class_name SkiState


@onready var player: Player = owner


func enter(_msg: Dictionary = {}) -> void:
	player.label.text = "Ski"
	player.animated_sprite.play("ski")

func physics_update(delta: float) -> void:
	
	if Input.is_action_just_pressed("player_jump"):
		player.state_machine.transition_to("Jump")
	
	player.velocity.y += player.acceleration * delta
	player.velocity.y = min(player.velocity.y, player.max_speed)

	var direction: float = Input.get_axis("player_left", "player_right")
	player.velocity.x = direction * player.move_speed

	player.move_and_slide()
	player.label.text = "Ski\nSpeed: " + str(player.velocity.y)
	
	
