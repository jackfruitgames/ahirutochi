extends Sprite2D

# TODO: change color according to added ingredients
# TODO: Bubbles (same color as pot content) -> new scene "Bubble"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("POT_COLOR_FADE")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
