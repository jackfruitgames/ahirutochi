extends Node2D

signal shot_fired
var tank_fill_procentage = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tmp_hit_button_pressed() -> void:
	tank_fill_procentage = 0
	$TankFillProgressBar.value = tank_fill_procentage
	shot_fired.emit()


func _on_tmp_fill_tank_button_pressed() -> void:
	$TankFillTimer.start()


func _on_tank_fill_timer_timeout() -> void:
	if tank_fill_procentage < 100:
		tank_fill_procentage += 10
	else:
		$TankFillTimer.stop()

	$TankFillProgressBar.value = tank_fill_procentage
