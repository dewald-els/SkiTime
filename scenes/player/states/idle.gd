extends State

@onready var player: Player = owner

func enter(_msg: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO
	player.label.text = "Idle"
	player.animated_sprite.play("idle")
