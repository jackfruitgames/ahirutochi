extends Node2D

var RED: Color = Color.html("#eb4034")
var GREEN: Color = Color.html("#67b000")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var new_health: int = GameState.health
	var style = $HealthBar.get("theme_override_styles/fill")
	if new_health < 30:
		style.bg_color = RED
	else:
		style.bg_color = GREEN
	$HealthBar.value = new_health
