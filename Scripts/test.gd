extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("drag"):
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_QUINT)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property($Sprite2D, "position", get_global_mouse_position(), 1.0)
