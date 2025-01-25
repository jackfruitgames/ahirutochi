extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var ingredient: Enums.INGREDIENT
var selected = false
var start_position = Vector2()

func set_type(type: Enums.INGREDIENT):
	var sprite = $Ingredient
	ingredient = type
	sprite.texture = load("res://assets/img/scribbles/%s.png" % Enums.INGREDIENT.keys()[type])
	
func set_start_position(_position: Vector2):	
	start_position = _position
	position = _position
	
func reset_position():
	position = start_position

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

func _on_ingredient_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "PotContentArea":
		selected = false
		GameState.is_hand_full = false
		
		reset_position()
	
		area.get_parent().add_ingredient(ingredient)
	print("COLLISION", area)
