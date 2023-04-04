extends Node2D

var current_ship: KinematicBody2D = null
var mouse_is_over_ship = null

func _ready():
	pass

func connect_ship_signals(instance):
	instance.connect("ship_clicked_on", self, "on_ship_clicked")

func _input(event):
	if event is InputEventMouseButton:
		print("clicked on screen!")
		
		setup_target_position(event.global_position)
		
func setup_target_position(position: Vector2):
	if not current_ship:
#		print("No ship selected!")
		return

	if not mouse_is_over_ship:		
		current_ship.target_position = position
		current_ship.agent.set_target_location(position)
		
func on_ship_clicked(instance):
	current_ship = instance
#	print("Current ship is now: " + instance.name)	
	current_ship.clicked()
	 
	print(current_ship)

func mouse_over(instance):
	mouse_is_over_ship = instance
	
func mouse_exit(instance):
	mouse_is_over_ship = null
	
