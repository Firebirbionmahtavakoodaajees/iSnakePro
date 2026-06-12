extends CharacterBody2D

@onready var timer:Timer = $Timer #:BTW the :Timer just tells var type
const SnakeSize = 225
var Direction = 1
var PrevDirection = 3

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
		if PrevDirection != 3:
			Direction = 1
	elif Input.is_action_just_pressed("Down"):
		if PrevDirection != 4:
			Direction = 2
	elif Input.is_action_just_pressed("Left"):
		if PrevDirection != 1:
			Direction = 3
	elif Input.is_action_just_pressed("Up"):
		if PrevDirection != 2:
			Direction = 4
			
	pass

func MoveTick() -> void:

	if Direction == 1:
		PrevDirection == 1
		position.x += -SnakeSize
	elif Direction == 2:
		PrevDirection == 2
		position.y += -SnakeSize
	elif Direction == 3:
		PrevDirection == 3
		position.x += SnakeSize
	else:
		PrevDirection == 4
		position.y +=SnakeSize
		
	PrevDirection = Direction
	
	snake_rect.position = global_position
	
	if not snake_rect.intersects(wall_rect):
		get_tree().quit()

	
