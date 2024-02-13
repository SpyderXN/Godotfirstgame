extends CharacterBody2D

var speed: int = 400

func _process(_delta):
	velocity.x = speed
	move_and_slide()


func hit():
	print("damage")
