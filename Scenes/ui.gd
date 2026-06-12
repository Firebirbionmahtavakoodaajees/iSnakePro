extends CanvasLayer

@onready var timer:Timer = $TimerTimer
@onready var timerLabel:Label = $GameTimer

var timePassed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(StartTimer)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func StartTimer() -> void:
	timerLabel.text = str(timePassed) + "s"
	timePassed += 1
	
