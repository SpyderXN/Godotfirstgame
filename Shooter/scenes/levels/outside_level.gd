extends LevelParent


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.4,0.4), 1)


func _on_gate_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	TransitionLayer.change_transition("res://scenes/levels/inside_level.tscn")
