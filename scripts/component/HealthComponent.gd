class_name HealthComponent
extends Node

@export var base_health: int = 100
var max_health: int
var current_health: int

func _ready() -> void:
	max_health = base_health
	current_health = max_health

func add_max_health(add: int) -> void:
	max_health += add


func took_damage(damage_dealt: int) -> void:
	current_health -= damage_dealt
