class_name HitBox
extends Area2D

@onready
var weapon_root: WeaponRoot = $"./.."

var shape: CollisionShape2D
var a_sprite: AnimatedSprite2D


func _ready() -> void:
	shape = weapon_root.get_node("Hitbox/HitboxShape")
	a_sprite = weapon_root.get_node("WeaponAnimation")
	#print(shape, "\n", weapon_root, "\n", a_sprite)
	weapon_root.left_mouse_pressed.connect(check_collision)
	a_sprite.sprite_frames_changed.connect(check_collision)


func check_collision() -> void:
	if a_sprite.frame == 3:
		shape.set_deferred("disabled", false)
	else:
		shape.set_deferred("disabled", true)
	return
