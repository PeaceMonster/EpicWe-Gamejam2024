extends Node


signal done_grating

func done_grating_emit():
	emit_signal("done_grating")
