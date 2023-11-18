extends Camera2D
class_name GameCamera

@export var player: Player
@export var smoothing: float = 5.0
@export var max_zoom: float = 1.25

func _physics_process(delta: float) -> void:
	global_position = lerp(global_position, player.global_position, smoothing * delta)
	if (global_position.y == player.global_position.y and player.velocity.y == player.max_speed):
		global_position.y = lerp(offset.y, player.global_position.y, smoothing)
