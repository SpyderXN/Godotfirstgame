extends CharacterBody2D

@export var speed: int = 500
var can_laser: bool = true
var can_grenade: bool = true

signal laser_shot(pos, player_direction)
signal grenade_shot(pos, player_direction)

func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$LaserParticle.emitting = true
		var laser_marker = $LaserMarker.get_children()
		var random_marker = laser_marker[randi() % laser_marker.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		can_laser = false
		$LaserTimer.start()
		laser_shot.emit(random_marker.global_position, player_direction)
	
	if Input.is_action_pressed("secondary") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var grenade_pos = $LaserMarker.get_children()[0].global_position
		var player_direction = (get_global_mouse_position() - position).normalized()
		can_grenade = false
		$GrenadeTimer.start()	
		grenade_shot.emit(grenade_pos, player_direction)


func _on_timer_timeout():
	can_laser = true


func _on_timer_timeout_grenade():
	can_grenade = true
	
