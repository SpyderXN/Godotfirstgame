extends LevelParent

func _on_exit_gate_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	TransitionLayer.change_transition("res://scenes/levels/outside_level.tscn")
