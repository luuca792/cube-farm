extends Node

signal state_tile_changed(map_pos: Vector2i, source_id: int, atlas_coord: Vector2i)

var tile_map := TileMapData.new()
var is_dragging_item : bool

func _init() -> void:
	_load_default_map()
	print("Sucessfully load default map data!: Size: ", tile_map.tiles.size())
	
func _ready() -> void:
	UIEventBus.item_pressed.connect(_handle_item_pressed)
	UIEventBus.item_released.connect(_handle_item_released)
	UIEventBus.tile_painted_with_item.connect(_apply_logic)
	
func _handle_item_pressed(_slot: InventorySlot) -> void:
	is_dragging_item = true
	
func _handle_item_released() -> void:
	is_dragging_item = false
	
func _apply_logic(world_pos: Vector2) -> void:
	if not is_dragging_item: # fail safe
		return
	var map_pos := Vector2i(floor(world_pos.x / GameSettingConst.TILE_SIZE), floor(world_pos.y / GameSettingConst.TILE_SIZE))
	var tile_slot := get_tile_slot(map_pos)
	if tile_slot == null:
		return
	if _can_apply(tile_slot):
		_apply_item_on_tile(tile_slot)
		
func _apply_item_on_tile(tile_slot: TileSlotData) -> void:
	var item_data : InventorySlot = InventoryManager.get_selected_item()
	if item_data.item.item_name == "water_can":
		var new_tile_data := TileAtlasData.new()
		new_tile_data.source_id = 1
		new_tile_data.atlas_x = 12
		new_tile_data.atlas_y = 8
		var layer_data := tile_slot.get_layer(MapLayerConst.STATE)
		if layer_data == null:
			layer_data = TileLayerData.new()
			layer_data.layer_name = MapLayerConst.STATE
			layer_data.tile = new_tile_data
			tile_slot.layers.append(layer_data)
		else:
			tile_slot.get_layer(MapLayerConst.STATE).tile = new_tile_data
		tile_slot.group = TileGroupConst.WATERED_SOIL
		state_tile_changed.emit(Vector2i(tile_slot.coords), new_tile_data.source_id, Vector2i(new_tile_data.atlas_x, new_tile_data.atlas_y))

func _can_apply(tile_slot: TileSlotData) -> bool:
	var items : Array[ItemData] = InteractItemCalculator.get_item_can_apply_on_tile_group(tile_slot.group)
	if items.size() > 0:
		return true
	return false

func get_tile_slot(map_pos: Vector2i) -> TileSlotData:
	return tile_map.get_slot_by_map_pos(map_pos)
	
func get_tile_group(map_pos: Vector2i) -> String:
	return tile_map.get_slot_by_map_pos(map_pos).group
	
func _load_default_map() -> void:
	var file = FileAccess.open("res://resources/tilemap//default-tile-map.json", FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()
	
	var data = JSON.parse_string(json_string)
	for json_slot in data:
		var slot = TileSlotData.new()
		slot.coords = Vector2i(int(json_slot["coords"]["x"]), int(json_slot["coords"]["y"]))
		slot.group = json_slot["group"]
		
		for json_layer in json_slot["layers"]:
			var layer = TileLayerData.new()
			layer.tile = TileAtlasData.new()
			layer.layer_name = json_layer["layer_name"]
			layer.tile.atlas_x = int(json_layer["tile"]["atlas_x"])
			layer.tile.atlas_y = int(json_layer["tile"]["atlas_y"])
			layer.tile.source_id = json_layer["tile"]["source_id"]
			slot.layers.append(layer)
		tile_map.tiles.append(slot)
