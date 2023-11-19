extends Node2D


@onready var ramp_area: Area2D = %RampArea


func _ready():
	ramp_area.connect("body_entered", on_body_entered)


func on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		SignalBus.emit_signal("ramp_entered")
