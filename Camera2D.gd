extends Camera2D

var speed = 200
var directionX = Vector2.ZERO
var directionY = Vector2.ZERO
@export var leftPressed = false
@export var rightPressed = false
@export var upPressed = false
@export var downPressed = false
var speedIncreasing = false
var speedDecreasing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(directionX * speed * delta)
	translate(directionY * speed * delta)
	pass
	
func _input(event):
	if event.is_action_pressed("right"): 
		directionX = Vector2.RIGHT
		rightPressed = true
	if event.is_action_pressed("left"):
		directionX = Vector2.LEFT
		leftPressed = true
	if event.is_action_pressed("down"):
		directionY = Vector2.DOWN
		downPressed = true
	if event.is_action_pressed("up"):
		directionY = Vector2.UP
		upPressed = true
		
	if event.is_action_released("right"):
		if leftPressed:
			directionX = Vector2.LEFT
		else:
			directionX = Vector2.ZERO
		rightPressed = false
	if event.is_action_released("left"):
		if rightPressed:
			directionX = Vector2.RIGHT
		else:
			directionX = Vector2.ZERO
		leftPressed = false
	if event.is_action_released("down"):
		if upPressed:
			directionY = Vector2.UP
		else:
			directionY = Vector2.ZERO
		downPressed = false
	if event.is_action_released("up"):
		if downPressed:
			directionY = Vector2.DOWN
		else:
			directionY = Vector2.ZERO
		upPressed = false

