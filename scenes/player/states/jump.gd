extends State
class_name JumpState

@onready var player: Player = owner

@export var jump_time: float = 25.0

var max_scale: float = 1.15


func enter(_msg: Dictionary = {}) -> void:
	player.label.text = "Jump"
	player.animated_sprite.play("jump")
	
func physics_update(delta: float) -> void:
	
	if is_equal_approx(player.scale.x, max_scale):
		player.state_machine.transition_to("Fall")
	else:
		player.scale = Vector2(lerp(player.scale.x, max_scale, jump_time * delta) , lerp(player.scale.y, max_scale, jump_time * delta))
		player.shadow.transform.origin = Vector2(
			lerp(player.shadow.transform.origin.x, 0.0, jump_time * delta),
			lerp(player.shadow.transform.origin.y, 2.0, jump_time * delta)
		)
		player.shadow.scale = Vector2(
			lerp(player.shadow.scale.x, 0.75, jump_time * delta),
			lerp(player.shadow.scale.y, 0.75, jump_time * delta),
		)
		
	player.move_and_slide()
