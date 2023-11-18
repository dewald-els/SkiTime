class_name Player
extends CharacterBody2D

@export var max_speed: float
@export var move_speed: float
@export var acceleration: float = 350.0
@export var decceleration = 100.0

@onready var shadow: Sprite2D = %ShadowSprite
@onready var label: Label = $Label
@onready var state_machine: StateMachine = %StateMachine
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite


func _ready() -> void:
	SignalBus.connect("finish_crossed", on_finish_crossed)


func on_finish_crossed() -> void:
	state_machine.transition_to("Stop")
