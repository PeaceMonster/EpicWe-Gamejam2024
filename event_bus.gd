extends Node

signal done_grating
signal fade_black

func done_grating_emit():
	emit_signal("done_grating")

func fade_to_black():
	emit_signal("fade_black")
