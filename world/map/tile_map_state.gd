extends TileMapLayer

func _ready():
	TileMapManager.state_tile_changed.connect(_on_tile_changed)

func _on_tile_changed(map_pos: Vector2i, source_id: int, atlas_coord: Vector2i):
	set_cell(map_pos, source_id, atlas_coord)
