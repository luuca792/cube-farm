extends Node
class_name TileGroupCalculator

func build_tile_group(tile_map_data: TileMapData) -> TileMapData:
	var result := tile_map_data
	for tile in result.tiles:
		
		if tile.get_layers() == null or tile.get_layers().size() == 0:
			push_error("Tile has no layers, can not detect tile group")
			continue
		
		if tile.get_layer(MapLayerConst.CROP) != null:
			var tile_data := tile.get_layer(MapLayerConst.CROP).tile
			var atlas_pos := Vector2i(tile_data.atlas_x, tile_data.atlas_y)
			if CropsTileManager.is_grown_crop(tile_data.source_id, atlas_pos):
				tile.group = TileGroupConst.GROWN_CROP
			if CropsTileManager.is_growing_crop(tile_data.source_id, atlas_pos):
				tile.group = TileGroupConst.GROWING_CROP
		
		if tile.get_layer(MapLayerConst.STATE) != null and StringUtils.isBlank(tile.group):
			var tile_data := tile.get_layer(MapLayerConst.STATE).tile
			var atlas_pos := Vector2i(tile_data.atlas_x, tile_data.atlas_y)
			if StateTileManager.is_water(atlas_pos):
				tile.group = TileGroupConst.WATERED_SOIL
		
		if tile.get_layer(MapLayerConst.FOREGROUND) != null and StringUtils.isBlank(tile.group):
			var tile_data := tile.get_layer(MapLayerConst.FOREGROUND).tile
			var atlas_pos := Vector2i(tile_data.atlas_x, tile_data.atlas_y)
			if ForegroundTileManager.is_soil(atlas_pos):
				tile.group = TileGroupConst.SOIL
		
		if tile.get_layer(MapLayerConst.BACKGROUND) != null and StringUtils.isBlank(tile.group):
			tile.group = TileGroupConst.ENVIRONMENT
	return result
