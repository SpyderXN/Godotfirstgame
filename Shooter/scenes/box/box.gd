extends ItemParent

func hit():
	if not opened:
		$Sprite2D2.hide()
		for i in range(5):
			var pos = $Spawner.get_child(randi()%$Spawner.get_child_count()).global_position
			open.emit(pos, current_direction)
		opened = true
