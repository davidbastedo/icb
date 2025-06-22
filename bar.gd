extends Node2D


var screen_size # size of game window

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	var leftservo = get_node("Left Servo")
	var rightservo = get_node("Right Servo")
	leftservo.position.x = 0
	rightservo.position.x = screen_size.x
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var leftposition = get_node("Left Servo").position
	var rightposition = get_node("Right Servo").position
	print("Left height: ", leftposition.y, " Right height: ", rightposition.y)
	
	var angle = leftposition.angle_to_point(rightposition)
	print("Angle: ", angle)
	var angle_deg = rad_to_deg(angle)
	print("Angle Deg ", angle_deg)
	
	var middlelocationy = (leftposition.y + rightposition.y) / 2
	var middlelocationx = (leftposition.x + rightposition.x) / 2
	print ("Middle Location xy: ", middlelocationx , " ", middlelocationy)
	
	var barNode = get_node("Bar Area2D")
	barNode.position.y = middlelocationy
	barNode.position.x = middlelocationx
	barNode.rotation = angle
	print("Bar location: ", barNode.position)
