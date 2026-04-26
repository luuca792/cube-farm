extends Node

var tile_map : TileMapData = TileMapData.new()

func _init() -> void:
	_load_default_map()
	print("Sucessfully load default map data!: Size: ", tile_map.tiles.size())
	
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
