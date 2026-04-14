class_name WeaponRoot
extends Node2D

signal left_mouse_pressed

@onready
var sprite: AnimatedSprite2D = $"WeaponAnimation"
@onready
var hitbox: HitBox = $"Hitbox"

func _ready() -> void:
	if not sprite:
		printerr("AnimatedSprite2D is missing")
	if not hitbox:
		printerr("Hitbox is missing")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		left_mouse_pressed.emit()
