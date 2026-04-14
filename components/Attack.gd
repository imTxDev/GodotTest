## Weapon's attack

class_name AttackComponent
extends Node

signal on_hit(damage: int, element: GEnum.Element)

#region Exported variables
@export
var weapon_element: GEnum.Element = GEnum.Element.None
@export
var damage: int = 0
@export
var hitbox: Area2D
#endregion

func _ready() -> void:
	pass
