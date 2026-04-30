extends PanelContainer

@onready var debug_label: Label = $Label
var last_clicked_world_pos : Vector2
var last_clicked_tile_pos : Vector2i
var last_clicked_tile_group : String

func _ready() -> void:
	UIEventBus.tile_pressed.connect(_update_last_clicked_tile)

func _process(_delta: float) -> void:
	_refresh()
	
func _update_last_clicked_tile(world_pos: Vector2) -> void:
	var map_pos := Vector2i(floor(world_pos.x / GameSettingConst.TILE_SIZE), floor(world_pos.y / GameSettingConst.TILE_SIZE))
	last_clicked_tile_pos = map_pos
	last_clicked_world_pos = world_pos
	last_clicked_tile_group = TileMapManager.get_tile_group(map_pos)

func _refresh() -> void:
	var selected_slot := InventoryManager.selected_slot
	var slots := InventoryManager.slots
	
	var text = ""
	text += "Selected item: "
	text += "%s" % selected_slot.item.item_name if selected_slot != null else ""
	
	text += "\nLast clicked tile: "
	text += "\n- tile_pos: %s" % str(last_clicked_tile_pos)
	text += "\n- world_pos: %s" % str(last_clicked_world_pos)
	text += "\n- tile_group: %s" % last_clicked_tile_group
	
	text += "\nInventory:"
	for slot in InventoryManager.slots:
		text += "\n- %s" % slot.item.item_name
		text += " : %d" % slot.quantity
	
	debug_label.text = text
