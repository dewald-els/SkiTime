extends Area2D


func _ready() -> void:
	connect("area_entered", on_area_entered)



func on_area_entered(_area: Area2D) -> void:
	SignalBus.emit_signal("finish_crossed")
