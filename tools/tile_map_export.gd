@tool
extends EditorScript

const SCENE_PATH = "res://scenes/main.tscn"
const TILE_MAP_NAME_GROUP: Dictionary = {
	"FarmMapBG": MapLayerConstant.BACKGROUND,
	"FarmMapFG": MapLayerConstant.FOREGROUND,
	"FarmMapState": MapLayerConstant.STATE,
	"FarmMapCrops": MapLayerConstant.CROP
}

var tile_map_data := TileMapData.new()
var tile_group_calculator := TileGroupCalculator.new()

func _build_map_data_from_scene() -> void:
	var scene = load(SCENE_PATH).instantiate()
	for child in scene.get_children():
		var layer := child as TileMapLayer
		if layer == null:
			continue
			
		for cell in layer.get_used_cells():
			var slot := tile_map_data.get_slot(cell.x, cell.y)
			if slot == null:
				slot = TileSlotData.new()
				slot.coords.x = cell.x
				slot.coords.y = cell.y
				tile_map_data.tiles.append(slot)
			
			var layer_data := TileLayerData.new()
			layer_data.layer_name = TILE_MAP_NAME_GROUP[layer.name]
			
			var tile_atlas_data := TileAtlasData.new()
			tile_atlas_data.source_id = layer.get_cell_source_id(cell)
			tile_atlas_data.atlas_x = layer.get_cell_atlas_coords(cell).x
			tile_atlas_data.atlas_y = layer.get_cell_atlas_coords(cell).y
			layer_data.tile = tile_atlas_data
			
			slot.layers.append(layer_data)
			
	scene.free()

func _export_to_file() -> void:
	var result := []
	for slot in tile_map_data.tiles:
		result.append(slot.to_dict())
	
	var file := FileAccess.open("res://resources/tilemap/default-tile-map.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(result, "\t"))
	file.close()
	
func _run() -> void:
	_build_map_data_from_scene()
	tile_map_data = tile_group_calculator.build_tile_group(tile_map_data)
	_export_to_file()
