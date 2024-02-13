extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var progress_bar: TextureProgressBar = $TextureProgressBar

var green: Color = Color(0, 0.9, 0, 1)
var red: Color = Color(0.9, 0, 0, 1)

func _ready():
	Globals.connect('stat_change', stat_change)
	on_laser_fire()
	on_grenade_fire()
	on_health_update()

func on_laser_fire():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func on_grenade_fire():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)

func on_health_update():
	progress_bar.value = Globals.health

func stat_change():
	on_laser_fire()
	on_grenade_fire()
	on_health_update()

func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount == 0:
		label.modulate = red
		icon.modulate = red
	else :
		label.modulate = green
		icon.modulate = green
