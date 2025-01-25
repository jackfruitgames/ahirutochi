extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var selected = false

func set_type(type: String):
	var sprite = $Ingredient
	sprite.texture = load("res://assets/img/scribbles/%s.png" % type)

func _on_ingredient_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if GameState.is_hand_full:
		return 
		
	if Input.is_action_just_pressed("ClickOnShelfItem"):
		GameState.is_hand_full = true
		selected = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			GameState.is_hand_full = false

func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
