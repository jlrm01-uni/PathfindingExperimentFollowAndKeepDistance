extends Node

var MAX_SPEED = 800
var MASS = 10
var SLOW_RADIUS = 100
var MINIMUM_SLOW_PERCENTAGE = 0.0

func _ready():
	pass

func follow_with_steering(velocity: Vector2,
			global_position: Vector2,
			target_position: Vector2,
			max_speed = MAX_SPEED, 
			mass = MASS) -> Vector2:
	var desired_velocity = (target_position - global_position).normalized() * max_speed
	
	var steering = (desired_velocity - velocity) / mass
	
	var velocity_with_steering = velocity + steering
	
	return velocity_with_steering

func arrive_to(velocity: Vector2,
			global_position: Vector2,
			target_position: Vector2,
			final_position: Vector2,
			max_speed = MAX_SPEED,
			slow_radius = SLOW_RADIUS, 
			mass = MASS) -> Vector2:
	var distance_to_target = global_position.distance_to(final_position)
	var slow_percentage
	var desired_velocity
	
	if distance_to_target < SLOW_RADIUS:
		slow_percentage = distance_to_target / SLOW_RADIUS + MINIMUM_SLOW_PERCENTAGE
	else:
		slow_percentage = 1
		
	desired_velocity = (target_position - global_position).normalized() * (max_speed * slow_percentage)
			
	var steering = (desired_velocity - velocity) / mass
	
	var velocity_with_steering = velocity + steering
	
	return velocity_with_steering
