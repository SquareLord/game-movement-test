extends Camera2D

var speedX = 0
var speedY = 0
var increase = 50
var increaseBound = 500
var directionX = Vector2.LEFT
var directionY = Vector2.UP
@export var leftPressed = false
@export var rightPressed = false
@export var upPressed = false
@export var downPressed = false
var speedXDir = 0 # 0 = zero, 1 = increase, 2 = decrease
var speedYDir = 0 # 0 = zero, 1 = increase, 2 = decrease
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if speedXDir == 1 and speedX < increaseBound:
		speedX = speedX + increase
	elif speedXDir == 2 and speedX > -1*increaseBound:
		speedX = speedX - increase
	elif speedXDir == 0 and speedX > 0:
		speedX = speedX - increase
	elif speedXDir == 0 and speedX < 0:
		speedX = speedX + increase

	if speedYDir == 1 and speedY < increaseBound:
		speedY = speedY + increase
	elif speedYDir == 2 and speedY > -1*increaseBound:
		speedY = speedY - increase
	elif speedYDir == 0 and speedY > 0:
		speedY = speedY - increase
	elif speedYDir == 0 and speedY < 0:
		speedY = speedY + increase
	translate(directionX * speedX * delta)
	translate(directionY * speedY * delta)
	pass
	
func _input(event):
	if event.is_action_pressed("right"):
		if leftPressed:
			speedXDir = 0
		else:
			speedXDir = 2 
		rightPressed = true
	if event.is_action_pressed("left"):
		if rightPressed:
			speedXDir = 0
		else:
			speedXDir = 1
		leftPressed = true
	if event.is_action_pressed("down"):
		if upPressed:
			speedYDir = 0
		else:
			speedYDir = 2 
		downPressed = true
	if event.is_action_pressed("up"):
		if downPressed:
			speedYDir = 0
		else:
			speedYDir = 1
		upPressed = true
		
	if event.is_action_released("right"):
		if leftPressed:
			speedXDir = 1
		else:
			speedXDir = 0
		rightPressed = false
	if event.is_action_released("left"):
		if rightPressed:
			speedXDir = 2
		else:
			speedXDir = 0
		leftPressed = false
	if event.is_action_released("down"):
		if upPressed:
			speedYDir = 1
		else:
			speedYDir = 0
		downPressed = false
	if event.is_action_released("up"):
		if downPressed:
			speedYDir = 2
		else:
			speedYDir = 0
		upPressed = false

