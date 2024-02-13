extends RigidBody2D

const speed = 300

func explode():
	$AnimationPlayer.play("explosion")
	
