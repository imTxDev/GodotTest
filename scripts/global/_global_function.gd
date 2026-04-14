## Hold common function for project
extends Node


## Create a timer
func create_timer_a(time: float, autostart: bool) -> Timer:
	var timer = Timer.new()
	timer.wait_time = time
	timer.autostart = autostart
	return timer


func create_timer(time: float) -> Timer:
	var timer = Timer.new()
	timer.wait_time = time
	return timer
