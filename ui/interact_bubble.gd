extends PanelContainer

@onready var interact_bubble: PanelContainer = $"."

const INTERACT_ITEM_SCENE = preload("res://ui/interact_item.tscn")
const SLOT_SIZE = 25

var items : Array[InventorySlot]

func _ready() -> void:
	UIEventBus.tile_pressed.connect(_handle_display)
	UIEventBus.item_pressed.connect(_handle_item_pressed)

func _handle_display(world_pos: Vector2) -> void:
	interact_bubble.visible = false
	_calculate_interactable_items(world_pos)
	if items.size() > 0:
		_populate_item()
		_show_bubble(world_pos)
		
func _handle_item_pressed(_slot: InventorySlot) -> void:
	interact_bubble.visible = false
	interact_bubble.position = Vector2(-100,-100)
	
func _calculate_interactable_items(world_pos: Vector2) -> void:
	var map_pos := Vector2i(floor(world_pos.x / GameSettingConst.TILE_SIZE), floor(world_pos.y / GameSettingConst.TILE_SIZE))
	var tile_group = TileMapManager.get_tile_group(map_pos)
	items = InteractItemCalculator.get_interactable_item(tile_group)
	
func _populate_item() -> void:
	var grid = $GridContainer
	for child in grid.get_children():
		child.free()

	for item in items:
		var slot = INTERACT_ITEM_SCENE.instantiate()
		grid.add_child(slot)
		slot.setup(item)
	
func _show_bubble(world_pos: Vector2):
	var tile_origin = Vector2(
		floor(world_pos.x / GameSettingConst.TILE_SIZE) * GameSettingConst.TILE_SIZE,
		floor(world_pos.y / GameSettingConst.TILE_SIZE) * GameSettingConst.TILE_SIZE
	)
	var tile_center = tile_origin + Vector2(GameSettingConst.TILE_SIZE / 2.0, GameSettingConst.TILE_SIZE / 2.0)
	
	interact_bubble.visible = true
	interact_bubble.size = Vector2i(items.size() * SLOT_SIZE, SLOT_SIZE)
	await get_tree().process_frame
	var screen_pos = get_viewport().get_canvas_transform() * tile_center
	var bubble_pos = screen_pos + Vector2(-interact_bubble.size.x / 2, -interact_bubble.size.y - 5)
	interact_bubble.position = bubble_pos
