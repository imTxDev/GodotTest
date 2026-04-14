## Handle entity's HP
class_name HPComponent
extends Node

#region Signals
## Emitted when heal
signal healed
## Emitted when entity's HP changes, including healing or taking damage
signal HP_changed
## Emitted when [member heal_rate] changed
signal max_HP_changed
## Emitted when entity's HP reaches zero or lower
signal HP_depleted
#endregion

#region Exported variables
@export
var can_heal: bool = true
@export
var heal_amount: int = 0
@export_range(0.05, 10, 0.05, "or_greater", "suffix: s")
var heal_delay_time: float = 0.5
@export
var max_HP: int = 100:
	set(value):
		max_HP = value
		max_HP_changed.emit()
#endregion

#region Variables
@onready
var current_HP: int = max_HP

# private variables
var heal_delay_timer: Timer
#endregion


func _ready() -> void:
	if can_heal:
		heal_delay_timer = GFunc.create_timer_a(heal_delay_time, true)
		add_child(heal_delay_timer)
		heal_delay_timer.timeout.connect(heal.bind(heal_amount))
	return


func modify_max_HP(amount: int) -> void:
	max_HP += amount
	max_HP_changed.emit()
	return


func heal(amount: int) -> void:
	if current_HP == max_HP:
		return
	
	current_HP = clampi(current_HP + amount, 0, max_HP)
	
	# Emit signals
	healed.emit()
	HP_changed.emit()
	return


func took_damage(damage_received: int) -> void:
	current_HP = clampi(current_HP - damage_received, 0, max_HP)
	HP_changed.emit()
	if current_HP == 0:
		HP_depleted.emit()
	return


func remove() -> void:
	queue_free()
