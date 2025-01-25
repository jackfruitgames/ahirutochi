extends PointLight2D

var prev_second = 0.0
var next_energy = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var second = int(Time.get_unix_time_from_system())
	if second > prev_second:
		prev_second = second
		next_energy = randf_range(0.4, 1.0)
		 
	energy =  lerp(energy, next_energy, 0.02)
