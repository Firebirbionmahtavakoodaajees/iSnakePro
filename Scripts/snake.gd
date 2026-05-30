extends CharacterBody2D

@onready var timer:Timer = $Timer #:BTW the :Timer just tells var type
const SnakeSize = 225
var direction = 1

# Centers the snake box around the snake node's origin
@onready var snake_rect = Rect2(global_position - Vector2(SnakeSize, SnakeSize) / 2, Vector2(SnakeSize, SnakeSize))
# Centers the wall box around the MapWalls node's origin
@onready var wall_rect = Rect2($"../MapWalls".global_position - Vector2(6*SnakeSize, 6*SnakeSize) / 2, Vector2(7*SnakeSize, 7*SnakeSize))


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(MoveTick)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Right"):
		if direction != 3:
			direction = 1
	elif Input.is_action_just_pressed("Down"):
		if direction != 4:
			direction = 2
	elif Input.is_action_just_pressed("Left"):
		if direction != 1:
			direction = 3
	elif Input.is_action_just_pressed("Up"):
		if direction != 2:
			direction = 4
	
	pass

func MoveTick() -> void:
	if direction == 1:
		position.x += -SnakeSize
	elif direction == 2:
		position.y += -SnakeSize
	elif direction == 3:
		position.x += SnakeSize
	else:
		position.y +=SnakeSize
	
	snake_rect.position = global_position
	
	if not snake_rect.intersects(wall_rect):
		get_tree().quit()

	
