extends Node2D

class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/laser/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/grenade/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/items.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect('open', _on_container_opened)

func _on_container_opened(pos, direction):
	var items = item_scene.instantiate()
	items.position = pos
	items.direction = direction
	$Items.call_deferred("add_child", items)

func _on_player_laser_shot(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)


func _on_player_grenade_shot(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	$Projectiles.add_child(grenade)
	grenade.linear_velocity = direction * grenade.speed
